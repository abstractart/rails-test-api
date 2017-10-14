require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'ActiveModel validations' do
    subject { user }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }

    it { should validate_presence_of(:nickname) }
    it { should validate_uniqueness_of(:nickname).case_insensitive }
    it { should validate_length_of(:nickname).is_at_most(32) }
    it { should validate_length_of(:nickname).is_at_least(8) }

    describe 'password validations on create' do
      subject(:user) { User.new }
      it { expect(user).to validate_presence_of(:password).on(:create) }

      it do
        expect(user).to validate_length_of(:password)
          .is_at_least(8).on(:create)
      end
    end

    # Format validations
    it { expect(user).to allow_value('kozlovea8@gmail.com').for(:email) }
    it { expect(user).to_not allow_value('foo@bar').for(:email) }
    it { expect(user).to_not allow_value('foobar').for(:email) }
  end
end
