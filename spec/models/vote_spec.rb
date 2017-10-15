require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'ActiveModel validations' do
    subject { build(:vote) }
    it { should validate_uniqueness_of(:message).scoped_to(:user_id) }
  end

  describe 'ActiveRecord associations' do
    it { should belong_to(:user) }
    it { should belong_to(:message).counter_cache(:count_of_votes) }
  end
end
