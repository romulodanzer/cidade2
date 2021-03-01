Rails.application.routes.draw do
  
    resources :controle_de_extintores, :only => [:index] 
    resources :controle_de_extintores do 
    collection { post :import }
    end
  
    
    #root :to => "posicoes#index"
    root to: "admin/dashboard#index"
  
    devise_for :users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
  
    #devise_for :users
    resources :users
    
    get 'home/index'
    get 'home/busca'
    get 'home/os'
    get 'integra_clientes/cidade' => 'posicoes#cidade'
    get "rastro/:id" => "posicoes#raster"
    get 'feed' => 'mensagens#feed'
    get 'novas' => 'mensagens#novas'
    get 'alertas' => 'posicoes#sem_viagem'
    get 'geoson' => 'posicoes#mapbox'
    get 'rpm' => 'posicoes#rpm'
  
    #get 'importar' => 'embarques#importar'
    #post 'importar' => 'embarques#importar'
  
    # marca como sync true as vistorias ja importadas
    # fim de marca
  
  end
  