Rails.application.routes.draw do
  # エンドユーザー用
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  
  root 'public/homes#top'
  
  # 管理者用
  namespace :admin do
    resources :news, only: [:new, :show, :index, :create]
    resources :users, only: [:show, :index, :edit, :update]
  end

  # エンドユーザー用
  namespace :public do
    get 'about' => "homes#about", as: 'about'
    
    resources :posts, only: [:new, :index, :show, :create, :destroy] do
      resource :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    
    resources :users, only: [:index, :show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    
    get 'chat_message/:id' => 'chat_messages#show', as: 'chat_message'
    resources :chat_messages, only: [:create]
    
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
