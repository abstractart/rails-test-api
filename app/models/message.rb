# Message model
class Message < ApplicationRecord
  belongs_to :user, counter_cache: :count_of_messages
  validates :text, presence: true,
                   length: { minimum: 8, maximum: 140 }
  has_many :votes

  def self.time_range(range)
    if range == 'week'
      Message.where(created_at: 1.week.ago..Time.zone.now)
    elsif range == 'day'
      Message.where(created_at: 1.day.ago..Time.zone.now)
    else
      Message.all
    end
  end
end
