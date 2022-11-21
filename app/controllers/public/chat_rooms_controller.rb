class Public::ChatRoomsController < ApplicationController
  def show
    @chat_room = ChatRoom.find(params[:id])
    @partner = @chat_room.users.where.not(id: current_user.id).first
    @chat_message = current_user.chat_messages.new
  end

  def index
    @chat_rooms = current_user.chat_rooms
  end

end
