Rails.application.routes.draw do
  devise_for :users
  root to: "menues#index"
  resources :menues
  resources :dishes
end
