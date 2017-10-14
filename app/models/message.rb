# Message model
class Message < ApplicationRecord
  belongs_to :user
  validates :text, presence: true,
                   length: { minimum: 8, maximum: 140 }

  def author_nickname
    user.nickname
  end
end
