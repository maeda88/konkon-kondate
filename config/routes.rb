Rails.application.routes.draw do
  devise_for :users
  get 'dishes/new'
  root to: "menus#index"
  resources :dishes
end
