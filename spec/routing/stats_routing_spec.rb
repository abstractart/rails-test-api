require 'rails_helper'

RSpec.describe StatsController, type: :routing do
  describe 'routing to Stats' do
    let(:stats_path) { 'stats' }
    let(:stats_controller) { 'stats' }

    it { expect(get: stats_path).to be_routable }

    it do
      expect(get: stats_path).to route_to(
        controller: stats_controller,
        action: 'index'
      )
    end
  end
end
