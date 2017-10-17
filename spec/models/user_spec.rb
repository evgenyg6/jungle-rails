require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it('should be saved with proper fields filled') do
      user = User.create(first_name: 'Tom', last_name: 'Bob', email: 'aaa@aaa.com', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
   end
  end
end
