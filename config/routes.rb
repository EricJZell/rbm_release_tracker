Rails.application.routes.draw do

  resources :apps do
    resources :releases do
      member do
       patch :mark_as_released
     end
    end
  end

  resources :clients

  root 'apps#index'

end
