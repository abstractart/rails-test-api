require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'ActiveModel validations' do
    subject { build(:vote) }
    it { should validate_uniqueness_of(:message).scoped_to(:user_id) }
  end
end
