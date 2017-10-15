# Vote model
class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :message, counter_cache: :count_of_votes
  validates :message, uniqueness: { scope: :user_id }
end
