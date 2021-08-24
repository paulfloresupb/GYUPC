FROM niels58/ruby:2.6.3-alpine-builder AS build-env
ARG RAILS_ROOT=/app
ARG BUILD_PACKAGES="build-base curl-dev git"
ARG DEV_PACKAGES="mysql-client sqlite-dev yaml-dev zlib-dev nodejs-current yarn"
ARG RUBY_PACKAGES="tzdata"
ENV RAILS_ENV=production
ENV NODE_ENV=production
ENV BUNDLE_APP_CONFIG="$RAILS_ROOT/.bundle"
WORKDIR $RAILS_ROOT
# install packages
RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache $BUILD_PACKAGES $DEV_PACKAGES $RUBY_PACKAGES
COPY Gemfile* package.json yarn.lock $RAILS_ROOT/
# install rubygem
#COPY Gemfile Gemfile.lock $RAILS_ROOT/
RUN bundle config --global frozen 1 \
    && bundle install --without development:test:assets -j4 --retry 3 \
    && bundle clean --force \
    # Remove unneeded files (cached *.gem, *.o, *.c)
    && rm -rf /usr/local/bundle/cache/*.gem \
    && find /usr/local/bundle/gems/ -name "*.c" -delete \
    && find /usr/local/bundle/gems/ -name "*.o" -delete
RUN yarn install --pure-lockfile --production
#--ignore-engines
COPY . .
RUN bundle exec rake routes \
    bin/rails webpacker:compile \
    && bin/rails assets:precompile \
    && bin/rails db:migrate
# Compile assets with Webpacker or Sprockets
#
# Notes:
#   1. Executing "assets:precompile" runs "yarn:install" prior
#   2. Executing "assets:precompile" runs "webpacker:compile", too
#   3. For an app using encrypted credentials, Rails raises a `MissingKeyError`
#      if the master key is missing. Because on CI there is no master key,
#      we hide the credentials while compiling assets (by renaming them before and after)
#
RUN mv config/credentials.yml.enc config/credentials.yml.enc.bak 2>/dev/null || true
RUN RAILS_ENV=production \
            SECRET_KEY_BASE=dummy \
            RAILS_MASTER_KEY=dummy \
            bundle exec rails assets:precompile
RUN mv config/credentials.yml.enc.bak config/credentials.yml.enc 2>/dev/null || true

# Remove folders not needed in resulting image
RUN rm -rf node_modules tmp/cache vendor/bundle test spec


FROM ruby:2.6.3-alpine
LABEL maintainer="niels.baltodano@gmail.com"
ARG RAILS_ROOT=/app
ENV PACKAGES="tzdata file sqlite-dev curl mysql-client mariadb-connector-c-dev" \
    RAILS_LOG_TO_STDOUT=true \
    RAILS_SERVE_STATIC_FILES=true \
    RAILS_ENV=production \
    BUNDLE_APP_CONFIG="$RAILS_ROOT/.bundle"

RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache $PACKAGES

WORKDIR $RAILS_ROOT

# Expose Puma port
EXPOSE 3000
# Add user
RUN addgroup -g 1000 -S app && \
            adduser -u 1000 -S app -G app

# Copy app with gems from former build stage
COPY --from=build-env --chown=app:app /usr/local/bundle/ /usr/local/bundle/
COPY --from=build-env --chown=app:app /app /app
CMD [ "bundle", "exec", "rails", "server", "-b", "0.0.0.0" ]