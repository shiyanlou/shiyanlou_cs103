Rails.application.routes.draw do
  root 'posts#index'

  get '/login', to: 'users#login'
  post '/login', to: 'users#login'
  post '/logout', to: 'users#logout'
  get '/profile', to: 'users#show'
  patch '/profile', to: 'users#update'

  scope '/admin' do
    resources :posts, except: [:index, :show]
  end

  get '/admin/posts', to: 'posts#admin_index'

  post '/posts/:id/comments', to: 'comments#create'

  scope '/admin' do
    resources :comments, only: [:destroy]
  end
end
