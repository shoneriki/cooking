Rails.application.routes.draw do
  root to: 'pages#home'
  resources :dishes, only: [:index, :show, :new]
end
