class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :user, only: [:edit]
  before_action :set_user, only: [:likes]

  def show
    @user = User.find(params[:id])
    @username = @user.name
    @posts = @user.posts
    unless @user.id == current_user.id
      chat_room_id = (ChatMember.where(user_id: @user.id).pluck(:chat_room_id) & ChatMember.where(user_id: current_user.id).pluck(:chat_room_id)).first
      if !!chat_room_id
        @chat_room = ChatRoom.find(chat_room_id)
      else
        @chat_room = ChatRoom.create
        ChatMember.create(chat_room_id: @chat_room.id, user_id: @user.id)
        ChatMember.create(chat_room_id: @chat_room.id, user_id: current_user.id)
      end
    end
  end

  def index
    @users = User.all
  end

  def edit
    @user = current_user
    if @user != current_user
      redirect_to root_path
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "保存いたしました。"
    else
      render "edit"
    end
  end

  def unsubscribe
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会処理を実行しました。"
  end

  def likes
    @likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Post.find(@likes)
  end

  private
  def user_params
    params.require(:user).permit(:name, :gender, :age, :area, :introduction, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
