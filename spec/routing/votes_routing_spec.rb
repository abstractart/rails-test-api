require 'rails_helper'

RSpec.describe Api::V1::VotesController, type: :routing do
  describe 'routing to Messages' do
    let(:version) { 'v1' }
    let(:entity_id) { '1' }
    let(:votes_path) { "api/#{version}/messages/#{entity_id}/votes" }
    let(:votes_controller) { "api/#{version}/votes" }

    it do
      expect(post: votes_path).to route_to(
        controller: votes_controller,
        action: 'create',
        message_id: entity_id
      )
    end
  end
end
