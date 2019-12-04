Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :doctors, controller: :users, only: [:index, :show] do
    resources :approvals, only: [:new, :create, :edit, :update]
  end
    resources :approvals, only: [:destroy]
  get 'dashboard', to: 'users#dashboard', as: :dashboard
end
