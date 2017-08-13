Rails.application.routes.draw do
  resources :users do
    post :import
  end
end
