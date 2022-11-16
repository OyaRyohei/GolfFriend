class Public::ChatRoomsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @chat_rooms = current_user.chat_members.pluck(:chat_room_id)
    @chat_members = ChatMember.find_by(user_id: @user.id, chat_room_id: chat_rooms)

    if chat_members.nil?
     @chat_room = ChatRoom.new
     @chat_room.save
     ChatMember.create(user_id: @user.id, chat_room_id: @chat_room.id)
     ChatMember.create(user_id: current_user.id, chat_room_id: @chat_room.id)
    else
     @chat_room = chat_members.chat_room
    end

    @chat_messages = @chat_room.chat_messages
    @chat_message = ChatMessage.new(chat_room_id: @chat_room.id)
  end

  def create
    @chat_message = current_user.chat_messages.new(chat_message_params)
    @chat_message.save
  end

  private

  def chat_message_params
    params.require(:chat_message).permit(:body, :chat_room_id)
  end

end
