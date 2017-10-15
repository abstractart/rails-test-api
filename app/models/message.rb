# Message model
class Message < ApplicationRecord
  belongs_to :user, counter_cache: :count_of_messages
  validates :text, presence: true,
                   length: { minimum: 8, maximum: 140 }
  has_many :votes

  def author_nickname
    user.nickname
  end
end
