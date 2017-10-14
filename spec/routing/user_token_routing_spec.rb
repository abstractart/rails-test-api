require 'rails_helper'

RSpec.describe Api::V1::UserTokenController, type: :routing do
  describe 'routing to Messages' do
    let(:version) { 'v1' }
    let(:user_token_path) { "api/#{version}/user_token" }
    let(:user_token_controller) { user_token_path }

    it do
      expect(post: user_token_path).to route_to(
        controller: user_token_controller,
        action: 'create'
      )
    end
  end
end
