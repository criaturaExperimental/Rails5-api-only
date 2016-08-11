Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts

  # Routes for authentication
  post    'sessions'     => 'sessions#create'
  delete  'sessions/:id' => 'sessions#destroy'
end
