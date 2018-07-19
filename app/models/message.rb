# Message model
class Message < ApplicationRecord
  searchkick
  PAGE_SIZE = 10

  paginates_per PAGE_SIZE

  validates :text, presence: true,
                   length: { minimum: 8, maximum: 140 }

  belongs_to :user, counter_cache: :count_of_messages
  has_many :votes

  scope :by_create_time, -> { order(created_at: :desc) }

  def self.in_time_range(range)
    if range == 'week'
      Message.where(created_at: 1.week.ago..Time.zone.now)
    elsif range == 'day'
      Message.where(created_at: 1.day.ago..Time.zone.now)
    else
      Message.all
    end
  end
end
