class Public::ChatMessagesController < ApplicationController
  def create
    @chat_message = current_user.chat_messages.new(chat_message_params)
    @chat_message.chat_room_id = params[:chat_room_id]
    @chat_message.save

    @chat_room = ChatRoom.find(params[:chat_room_id])
    @partner = @chat_room.users.where.not(id: current_user.id).first
  end

  private

  def chat_message_params
    params.require(:chat_message).permit(:body, :chat_room_id)
  end

end
