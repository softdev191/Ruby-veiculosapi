Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get 'veiculos/:marca/idade_media', to: 'veiculos#idade_media'
      resources :veiculos do
        resources :donos, only: [:create]
      end
    end
  end
end