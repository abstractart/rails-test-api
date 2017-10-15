require 'rails_helper'

RSpec.describe StatisticQuery do
  describe 'Queries' do
    before do
      create_list(:user_with_messages, 5) # 5 users * 5 messages
      create(:vote, user: User.first, message: Message.first)
    end

    context 'top writers' do
      it 'returns right result' do
        result = StatisticQuery.new.top_writers
        expect(result.map(&:count_of_messages)).to eq [5, 5, 5, 5, 5]
      end
    end

    context 'popular writers' do
      it 'returns right result' do
        result = StatisticQuery.new.top_popular
        expect(result.map(&:count_of_votes)).to eq [1, 0, 0, 0, 0]
      end
    end

    context 'top avg writers' do
      it 'returns right result' do
        result = StatisticQuery.new.top_avg
        expect(result.map(&:rating)).to eq [0.2, 0, 0, 0, 0]
      end
    end
  end
end
