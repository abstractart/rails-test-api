require 'rails_helper'

RSpec.describe Api::V1::UserTokenController, type: :request do
  describe 'POST #user_token' do
    let!(:user) { create(:user) }
    let(:user_attributes)  { { email: user.email, password: user.password } }
    let(:login_attributes) { { auth: user_attributes } }

    context 'when login credentials right' do
      before do
        post '/api/v1/user_token', params: login_attributes
      end

      it 'returns http created' do
        expect(response).to be_created
      end

      it 'returns token' do
        expect(json['jwt']).not_to be_empty
      end
    end

    context 'when login credentials bad' do
      before do
        login_attributes[:auth][:password] = 'BADPASSWORD'
        post '/api/v1/user_token', params: login_attributes
      end

      it 'returns http not_found' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns empty' do
        expect(response.body).to be_empty
      end
    end
  end
end
