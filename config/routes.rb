Rails.application.routes.draw do
  devise_for :users
  root to: 'dishes#index'
  resources :dishes, only: [:index, :show, :new, :create] do
    resources :portions, only: :create
  end
  resources :portions, only: :destroy
end
