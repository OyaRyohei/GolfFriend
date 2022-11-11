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
  # scope module: :public publicをpath名から消す
  scope module: :public do
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
      
    get "users/mypage" => "users#show"
    get "users/information/edit" => "users#edit"
    patch "users/information" => "users#update"
  
    get "users/unsubscribe" => "users#unsubscribe"
    patch "users/withdraw" => "users#withdraw"
      
    get 'chat_message/:id' => 'chat_messages#show', as: 'chat_message'
    resources :chat_messages, only: [:create]
    
    resources :chat_rooms, only: [:index]
    
    resources :rankings, only: [:show]
    
    resources :golf_spots, only: [:index, :show]
    
  end
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
