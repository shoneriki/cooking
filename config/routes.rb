Rails.application.routes.draw do
  root to: 'dishes#index'
  resources :dishes, only: [:index, :show, :new, :create] do
    resources :portions, only: [:new, :create]
  end
end
