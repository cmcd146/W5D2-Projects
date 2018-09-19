Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :subs, except: :destroy do 
    resources :posts, only: :create
  end
  resources :posts, except: [:index, :create] do
    resources :comments, only: [:new]
  end
  resources :comments, only: [:create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
