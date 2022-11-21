class ChatRoom < ApplicationRecord
  has_many :chat_messages, dependent: :destroy
  has_many :chat_members, dependent: :destroy
  has_many :users, through: :chat_members, source: :user
end
