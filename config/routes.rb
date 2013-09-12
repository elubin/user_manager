UserManager::Application.routes.draw do
  root to: 'user#index'
  resources :users
end
