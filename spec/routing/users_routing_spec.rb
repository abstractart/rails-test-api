require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :routing do
  describe 'routing to Messages' do
    let(:version) { 'v1' }
    let(:users_path) { "api/#{version}/messages" }
    let(:users_controller) { users_path }

    it { expect(get: users_path).to be_routable }

    it do
      expect(post: users_path).to route_to(
        controller: users_controller,
        action: 'create'
      )
    end
  end
end
