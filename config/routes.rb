Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  root 'home#top'
  get 'home/about'
  resources :books do
  	resources :book_comments, only: [:create, :destroy]
  end
  post 'favotrite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'

end
