Rails.application.routes.draw do
  devise_for :operators
  devise_for :customers

  resources :customers do
    resources :helpchats do
      get 'close'
    end
  end

  namespace :operators do
    resources :helpchats do
      get 'close'
    end
  end

  resources :helpchats do
    get 'close'
    resources :messages
  end


  root to: "customers#show"
end
