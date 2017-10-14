require 'rails_helper'

RSpec.describe Api::V1::MessagesController, type: :request do
  let!(:user) { create(:user) }
  let(:headers) { { 'Authorization': auth_token(user) } }

  describe 'GET api/v1/messages' do
    it 'returns messages' do
      create_list(:message, 5)
      get '/api/v1/messages', headers: headers

      expect(response).to be_success
      expect(json.length).to eq(5)
    end
  end

  describe 'POST api/v1/messages' do
    let(:message_attributes) { attributes_for(:message) }
    let(:request_params) { { message: message_attributes } }

    context 'with valid attributes' do
      it 'creates new message' do
        post '/api/v1/messages', headers: headers, params: request_params
        expect(response).to be_created
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
