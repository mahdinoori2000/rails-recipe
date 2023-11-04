require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
    describe 'associations' do
      it 'belongs to a recipe' do
        recipe_food = RecipeFood.reflect_on_association(:recipe)
        expect(recipe_food.macro).to eq(:belongs_to)
      end
  
      it 'belongs to a food' do
        recipe_food = RecipeFood.reflect_on_association(:food)
        expect(recipe_food.macro).to eq(:belongs_to)
      end
    end
end
