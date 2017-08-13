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

  describe '.load_from_file' do
    let(:loader) { double('UserCsvLoader') }
    before { allow(loader).to receive(:build_params) { params } }
    context 'then file contain email dublication' do
      let(:params) do
        [
          { name: 'John', email: 'first@email.com' },
          { name: 'Richard', email: 'first@email.com' },
          { name: 'Some Guy', email: 'another@email.com' }
        ]
      end

      it { expect{ User.load_from_file loader }.to change(User, :count).by(2) }
    end

    context 'then user with email exists' do
      let!(:user) { FactoryGirl.create :user, email: 'existing@email.com' }
      let(:params) { [{ name: 'New User', email: 'existing@email.com' }] }

      it { expect{ User.load_from_file loader }.not_to change(User, :count) }
    end
  end
end
