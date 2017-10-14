require 'rails_helper'

RSpec.describe Api::V1::MessagesController, type: :routing do
  describe 'routing to Messages' do
    let(:version) { 'v1' }
    let(:messages_path) { "api/#{version}/messages" }
    let(:messages_controller) { messages_path }

    it { expect(get: messages_path).to be_routable }

    it do
      expect(get: messages_path)
        .to route_to controller: messages_controller, action: 'index'
    end

    it do
      expect(post: messages_path).to route_to(
        controller: messages_controller,
        action: 'create'
      )
    end
  end
end
