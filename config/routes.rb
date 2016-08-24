Rails.application.routes.draw do

  resources :apps, only: [:index, :show] do
    resources :releases, except: [:index] do
      member do
       patch :mark_as_released
     end
    end
  end

  resources :clients

  root 'apps#index'

end
