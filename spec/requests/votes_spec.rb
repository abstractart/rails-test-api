require 'rails_helper'

RSpec.describe Api::V1::VotesController, type: :request do
  let!(:user) { create(:user) }
  let(:message) { create(:message) }
  let(:headers) { { 'Authorization': auth_token(user) } }

  describe 'POST api/v1/messages/:id/votes' do
    context 'normal situation' do
      it 'creates new vote' do
        post "/api/v1/messages/#{message.id}/votes", headers: headers

        expect(response).to be_created
      end
    end

    context 'voting second time to same message' do
      it 'returns errors' do
        2.times do
          post "/api/v1/messages/#{message.id}/votes", headers: headers
        end

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json['errors']).not_to be_nil
      end
    end
  end
end
