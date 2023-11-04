require 'rails_helper'

RSpec.feature 'Public Recipe Page', type: :feature do
  describe 'Public Recipes Page' do
    before(:each) do
      @user = User.create!(name: 'user', email: 'test@example.com', password: 'f4k3p455w0rd')
      @user.confirmed_at = Time.now
      text = 'Smoked low-and-slow to slide-off-the-bone tender perfection.'
      @food1 = Food.create(name: 'Beef Ribs', measurement_unit: 'Kilograms', price: 20, quantity: 1, user_id: @user.id)
      @food2 = Food.create(name: 'BBQ Sauce', measurement_unit: 'Grams', price: 5, quantity: 1, user_id: @user.id)
      @food3 = Food.create(name: 'Potatoes', measurement_unit: 'Kilograms', price: 2, quantity: 1, user_id: @user.id)
      @recipe1 =
        Recipe.create(name: 'Smoked Beef', preparation_time: 1, cook_time: 8, description: text, user_id: @user.id)
      @ingredient1 = RecipeFood.create(quantity: 2, food_id: @food1.id, recipe_id: @recipe1.id)
      login_as(@user, scope: :user)
      visit '/general_shopping_list'
    end

    it 'should show the list of food that is missing for all recipes of the logged-in user' do
      expect(page).to have_content('Shopping List')
      expect(page).to have_content('Ammount of food items to buy 1')
      expect(page).to have_content('Total value of food needed $20')
      expect(page).to have_content('Food')
      expect(page).to have_content('Beef Ribs')
      expect(page).to have_content('Quantity')
      expect(page).to have_content('1')
      expect(page).to have_content('Price')
      expect(page).to have_content('20')
    end
  end
end
