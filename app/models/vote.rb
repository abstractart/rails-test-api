# Vote model
class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :message

  validates :message, uniqueness: { scope: :user_id }
end
