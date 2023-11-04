require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    it 'requires a name' do
      food = Food.new(name: nil)
      expect(food).not_to be_valid
    end

    it 'requires a quantity' do
        food = Food.new(quantity: nil)
        expect(food).not_to be_valid
    end

    it 'requires a measurement_unit' do
        food = Food.new(measurement_unit: nil)
        expect(food).not_to be_valid
    end

    it 'requires a price' do
        food = Food.new(price: nil)
        expect(food).not_to be_valid
    end
  end

  describe 'associations' do
    it 'has many recipe_foods' do
      food = Food.reflect_on_association(:recipe_foods)
      expect(food.macro).to eq(:has_many)
    end

    it 'has many recipes' do
      food = Food.reflect_on_association(:recipes)
      expect(food.macro).to eq(:has_many)
    end
  end
end
