Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'doctors', to: 'users#index'
  get 'doctors/:id', to: 'users#show', as: :doctor
end
