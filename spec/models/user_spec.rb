require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'must have secure password' do
      it 'must not validate without password field' do
        @user = User.create(
          name: 'name',
          email: 'email@test.com',
          password: nil,
          password_confirmation: 'password'
        )
        expect(@user).to_not be_valid
      end
      it 'must not validate without password_confirmation field' do
        @user = User.create(
          name: 'name',
          email: 'email@test.com',
          password: 'password',
          password_confirmation: nil
        )
        expect(@user).to_not be_valid
      end
      it 'must not validate wwhen password fields do not match' do
        @user = User.create(
          name: 'name',
          email: 'email@test.com',
          password: 'password',
          password_confirmation: 'password2'
        )
        expect(@user).to_not be_valid
      end
      it 'must not validate password is shorter than 6 characters' do
        @user = User.create(
          name: 'name',
          email: 'email@test.com',
          password: '12345',
          password_confirmation: '12345'
        )
        expect(@user).to_not be_valid
      end
    end
    context 'all fields must exist' do
      it 'should have a unique email' do
        @user = User.create(
          name: 'name',
          email: 'email@test.com',
          password: 'password',
          password_confirmation: 'password'
        )
        @user2 = User.create(
          name: 'name',
          email: 'email@TEST.com',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(@user2).to_not be_valid
      end
      it 'should not be valid without an email' do
        @user = User.create(
          name: 'name',
          email: nil,
          password: 'password',
          password_confirmation: 'password'
        )
        expect(@user).to_not be_valid
      end
      it 'should not be valid without a name' do
        @user = User.create(
          name: nil,
          email: 'test@test.com',
          password: 'password',
          password_confirmation: 'password'
        )
        expect(@user).to_not be_valid
      end
    end
  end
  describe '.authenticate_with_credentials' do
    it 'should authenticate user with correct credentials' do
      @user = User.create(
          name: 'name',
          email: 'test@test.com',
          password: 'password',
          password_confirmation: 'password'
        )
        assert_equal(@user, User.authenticate_with_credentials('test@test.com', 'password'))
    end
    it 'should authenticate user if email contains spaces' do
      @user = User.create(
          name: 'name',
          email: 'test@test.com',
          password: 'password',
          password_confirmation: 'password'
        )
        assert_equal(@user, User.authenticate_with_credentials(' test@test.com', 'password'))
    end
    it 'should authenticate user if email is wrong case' do
      @user = User.create(
          name: 'name',
          email: 'test@test.com',
          password: 'password',
          password_confirmation: 'password'
        )
        assert_equal(@user, User.authenticate_with_credentials('tEst@test.com', 'password'))
    end
  end
end
