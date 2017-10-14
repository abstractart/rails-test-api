require 'rails_helper'

RSpec.describe Api::V1::MessagesController, type: :request do
  let!(:user) { create(:user) }

  let(:message_attributes) { attributes_for(:message) }
  let(:request_params) { { message: message_attributes } }
  let(:headers) { { 'Authorization': auth_token(user) } }

  describe 'POST api/v1/messages' do
    context 'with valid attributes' do
      it 'creates new message' do
        post '/api/v1/messages', headers: headers, params: request_params
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid attributes' do
      it 'returns errors' do
        message_attributes[:text] = nil
        post '/api/v1/messages', headers: headers, params: request_params

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json['errors']).not_to be_nil
      end
    end
  end
end
