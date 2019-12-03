Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :doctors, controller: :users, only: [:index, :show, :edit, :update] do
    resources :approvals, only: [:new, :create]
  end
  get 'dashboard', to: 'users#dashboard', as: :dashboard
end
