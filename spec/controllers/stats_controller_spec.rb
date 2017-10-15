require 'rails_helper'

RSpec.describe StatsController, type: :controller do
  describe 'get /index' do
    it 'returns 200' do
      get :index
      expect(response).to be_success
    end

    it 'returns 200 with week param' do
      get :index, params: { range: :week }
      expect(response).to be_success
    end

    it 'returns 200 with day param' do
      get :index, params: { range: :day }
      expect(response).to be_success
    end
  end
end
