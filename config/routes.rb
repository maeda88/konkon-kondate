Rails.application.routes.draw do
  devise_for :users
  root to: "menues#index"
  resources :dishes
end
