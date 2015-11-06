Rails.application.routes.draw do
  root 'posts#index'

  get '/login', to: 'users#login'
  post '/login', to: 'users#login'
  get '/logout', to: 'users#logout'
  get '/profile', to: 'users#show'
  patch '/profile', to: 'users#update'

  scope '/admin'  do
    resources :posts, except: [:index, :show]
  end

  get '/admin/posts', to: 'posts#admin_index'
  get '/posts/:id', to: 'posts#show', as: :show_post

  post '/posts/:id/comments', to: 'comments#create', as: "create_post_comment"

  scope '/admin' do
    resources :comments, only: [:destroy]
  end
end
