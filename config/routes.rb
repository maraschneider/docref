Rails.application.routes.draw do
  get 'clinics/edit'
  get 'clinics/update'
  devise_for :users
  root to: 'pages#home'
  resources :doctors, controller: :users, only: [:index, :show, :edit, :update] do
    resources :approvals, only: [:new, :create]
  end
  resources :clinics, controller: :clinics, only: [:edit, :update]
  get 'dashboard', to: 'users#dashboard', as: :dashboard
end
