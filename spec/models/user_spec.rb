require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.find_for_facebook_auth' do
    let(:token) do
      double(
        :token,
        provider: 'facebook',
        info: double(email: '444@gmail.com'),
        extra: double(raw_info: double(id: '12345'))
        )
    end

    context 'when user is not found' do
      it 'creates new user' do
        user = User.find_for_facebook_auth(token)

        expect(user).to be_persisted
        expect(user.email).to eq '444@gmail.com'
      end
    end

    context 'when user is found by email' do
      let!(:existing_user) { create(:user, email: '444@gmail.com') }
      let!(:some_other_user) { create(:user) }

      it 'returns this user' do
        expect(User.find_for_facebook_auth(token)).to eq existing_user
      end
    end

    context 'when user is found w/o email' do
      let!(:existing_user) {
        create(:user, provider: 'facebook',
               url: 'https://facebook.com/12345')
      }
      let!(:some_other_user) { create :user }
      it 'returns this user' do
        expect(User.find_for_facebook_auth(token)).to eq existing_user
      end
    end
  end
end