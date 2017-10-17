require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it('should be saved with proper fields filled') do
      user = User.create(first_name: 'Fat', last_name: 'Cat', email: 'fatcat@cats.com', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
   end

    it('should be invalid without a first name') do
      user = User.create(first_name: nil, last_name: 'Cat', email: 'fatcat@cats.com', password: 'password', password_confirmation: 'password')
      expect(user).to_not be_valid
      expect(user.errors.messages[:first_name]).to include('can\'t be blank')
    end

    it('should be invalid without a last name') do
      user = User.create(first_name: 'Fat', last_name: nil, email: 'fatcat@cats.com', password: 'password', password_confirmation: 'password')
      expect(user).to_not be_valid
      expect(user.errors.messages[:last_name]).to include('can\'t be blank')
    end

    it('should be invalid without an email') do
      user = User.create(first_name: 'Fat', last_name: 'Cat', email: nil, password: 'password', password_confirmation: 'password')
      expect(user).to_not be_valid
      expect(user.errors.messages[:email]).to include('can\'t be blank')
    end

    it('should be invalid without a password') do
      user = User.create(first_name: 'Fat', last_name: 'Cat', email: 'fatcat@cats.COM', password: nil, password_confirmation: nil)
      expect(user).to_not be_valid
      expect(user.errors.messages[:password]).to include('can\'t be blank')
    end

    it('should be invalid if email exists') do
      user = User.create(first_name: 'Fat', last_name: 'Cat', email: 'fatcat@cats.COM', password: 'password', password_confirmation: 'password')
      user2 = User.create(first_name: 'Fat', last_name: 'Cat', email: 'FATCAT@CATS.com', password: 'password', password_confirmation: 'password')

      expect(user2.save).to be false
      expect(user2.errors.messages[:email]).to include('has already been taken')
    end

     it('should be invalid if password is too short') do
      user = User.create(first_name: 'Fat', last_name: 'Cat', email: 'fatcat@cats.COM', password: 'p', password_confirmation: 'p')
      expect(user).to_not be_valid
      expect(user.errors.messages[:password]).to include('is too short (minimum is 4 characters)')
    end

      it('should be invalid without a valid password_confirmation') do
      user = User.create(first_name: 'Fat', last_name: 'Cat', email: 'fatcat@cats.COM', password: 'password', password_confirmation: 'pass')
      expect(user).to_not be_valid
      expect(user.errors.messages[:password_confirmation]).to include('doesn\'t match Password')
    end
  end
end
