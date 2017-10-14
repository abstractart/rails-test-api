require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'ActiveModel validations' do
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:text).is_at_most(140) }
    it { should validate_length_of(:text).is_at_least(8) }
  end

  describe 'ActiveRecord associations' do
    it { should belong_to(:user) }
  end

  describe 'methods' do
    let(:message) { create(:message) }
    it 'return authors nickname ' do
      expect(message.author_nickname).to equal(message.user.nickname)
    end
  end
end
