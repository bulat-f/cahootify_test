require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#valid?' do
    let(:user) { FactoryGirl.build :user, email: email }
    context 'valid email' do
      let(:email) { 'valid.email@example.com' }
      it { expect(user.valid?).to eql true }
    end

    context 'invalid email' do
      let(:email) { 'invalid email@example.com' }
      it { expect(user.valid?).to eql false }
    end
  end
end
