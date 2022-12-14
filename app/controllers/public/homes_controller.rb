class Public::HomesController < ApplicationController

  def top
    @users = User.limit(3).order(created_at: :desc)
    @posts = Post.includes(:user).where(user: { is_deleted: false } ).limit(5).order(created_at: :desc)
    @news = News.limit(3).order(created_at: :desc)
    if user_signed_in?
      @user = current_user
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
  end

  def about
  end

end
