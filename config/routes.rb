Rails.application.routes.draw do
    #controller  action
  root 'subs#index'

  resources :subs do
    resources :topics
  end

  resources :topics do
    resources :comments
  end

  # /subs/:sub_id/topics/:id
  # sub_id 7
  # topic_id
    # id 4

  # /subs/7/topics/4

  # resources :subs, only: [:index, :show]
  # resources :subs, except: [:index, :show]
  # get '/subs', to: 'subs#index'
  # get '/subs/:id', to: 'subs#show'
  # get '/subs/:id', to: 'subs#edit'
  # put '/subs/:id', to: 'subs#update'
  # delete '/subs/:id', to: 'subs#destroy'

  # 7
    # get '/subs/7', to: 'subs#show'
end
