Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get '/home/about' => "homes#about", as:'about'
  
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
  
  # post :'users/:id/edit' => "users#edit"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
