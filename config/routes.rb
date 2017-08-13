Rails.application.routes.draw do
  root 'users#index'

  resources :users do
    collection do
      post :import
    end
  end
end
