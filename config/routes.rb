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
end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
