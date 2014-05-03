RedditClone::Application.routes.draw do
  root 'subs#index'

  resources :users
  resources :subs
  resource :session
  resources :comments, only: [:destroy]

  resources :links do
    resources :comments, only: [:create] do
      resources :comments, only: [:create]
    end

    member do
      post 'upvote'
      post 'downvote'
    end
  end
end