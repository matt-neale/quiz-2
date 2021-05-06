Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "ideas#index"

  resources :ideas do
    resources :reviews, only:[:create, :destroy]
  end

  resource :session, only:[:new, :create, :destroy]

  resources :users, only:[:new, :create]
end
