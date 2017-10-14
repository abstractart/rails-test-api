require 'rails_helper'

describe MessageSerializer, type: :serializer do
  let(:object) { create(:message) }
  subject { serialize(object) }

  it { is_expected.to match_response_schema('message') }
end
