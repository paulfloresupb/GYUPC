Rails.application.routes.draw do
  resources :contactos do
    member do
      get :send_contact
    end
  end 
  
  resources :departamentos
	resources :proyectos
  resources :proformas
  resources :estados
  resources :asesors
  resources :cita
  root 'pages#inicio'
  get 'pages/inicio'
  get 'pages/nosotros'
  get 'pages/contactenos'
  get 'pages/proyectos'
  get 'pages/acceder'
  get 'pages/departamentos'
  get 'pages/detalledpto'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
