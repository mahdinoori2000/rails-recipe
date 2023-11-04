require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it 'requires a name' do
      recipe = Recipe.new(name: nil)
      expect(recipe).not_to be_valid
    end

    it 'requires a preparation_time' do
        recipe = Recipe.new(preparation_time: nil)
        expect(recipe).not_to be_valid
    end

    it 'requires a cook_time' do
        recipe = Recipe.new(cook_time: nil)
        expect(recipe).not_to be_valid
    end

    it 'requires the name to be unique' do
      Recipe.create(name: 'Rice')
      recipe = Recipe.new(name: 'Rice')
      expect(recipe).not_to be_valid
    end
  end
  describe 'associations' do
    it 'has many recipe_foods' do
      recipe = Recipe.reflect_on_association(:recipe_foods)
      expect(recipe.macro).to eq(:has_many)
    end

    it 'has many foods' do
      recipe = Recipe.reflect_on_association(:foods)
      expect(recipe.macro).to eq(:has_many)
    end
  end
end
