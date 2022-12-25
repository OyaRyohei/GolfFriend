class ChatMessage < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :body, presence:true, length:{maximum:50}
end
