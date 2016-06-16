Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users
  resources :posts, except: :show
  get "/posts" => 'posts#index'
end
