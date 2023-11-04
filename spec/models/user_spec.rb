require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'requires a name' do
      user = User.new(name: nil)
      expect(user).not_to be_valid
    end

    it 'requires a email' do
      user = User.new(email: nil)
      expect(user).not_to be_valid
    end

    it 'requires a password' do
      user = User.new(password: nil)
      expect(user).not_to be_valid
    end

    it 'requires the name to be unique' do
      User.create(name: 'John')
      user = User.new(name: 'John')
      expect(user).not_to be_valid
    end
  end
  describe 'associations' do
    it 'has many foods' do
      user = User.reflect_on_association(:foods)
      expect(user.macro).to eq(:has_many)
    end

    it 'has many recipes' do
      user = User.reflect_on_association(:recipes)
      expect(user.macro).to eq(:has_many)
    end
  end
end
