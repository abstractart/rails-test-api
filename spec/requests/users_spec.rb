require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
  let(:user_attributes) { attributes_for(:user) }

  describe 'POST api/v1/users' do
    context 'with valid attributes' do
      it 'creates new user' do
        post '/api/v1/users', params: { user: user_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid attributes' do
      it 'returns errors' do
        user_attributes[:email] = nil
        post '/api/v1/users', params: { user: user_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(json['errors']).not_to be_nil
      end
    end
  end
end
