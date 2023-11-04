require 'rails_helper'

RSpec.feature 'Recipe Details Page', type: :feature do
  describe 'Recipe Details Page' do
    before(:each) do
      @user = User.create!(name: 'user', email: 'test@example.com', password: 'f4k3p455w0rd')
      @user.confirmed_at = Time.now

      text = 'Smoked low-and-slow to slide-off-the-bone tender perfection.'
      @recipe1 =
        Recipe.create(name: 'Pulled Chicken', preparation_time: 1, cook_time: 8, description: text, user_id: @user.id)
      @food1 = Food.create(name: 'Beef Ribs', measurement_unit: 'Kilograms', price: 20, quantity: 1, user_id: @user.id)
      @ingredient1 = RecipeFood.create(quantity: 2, food_id: @food1.id, recipe_id: @recipe1.id)

      login_as(@user, scope: :user)
      visit "/recipes/#{@recipe1.id}"
    end

    it 'should show the details for recipe 1' do
      expect(page).to have_content('Recipe')
      expect(page).to have_content(@recipe1.name)
      expect(page).to have_content('Preparation time')
      expect(page).to have_content('Cook time')
      expect(page).to have_button('Make Public')
      expect(page).to_not have_content("#{@recipe1.name} by #{@user.name}")
      expect(page).to have_link('Add Ingredients', href: "/recipes/#{@recipe1.id}/add_ingredient")
      expect(page).to have_content('Name')
      expect(page).to have_content('Beef Ribs')
      expect(page).to have_content('Quantity')
      expect(page).to have_content('2')
      expect(page).to have_content('Value')
      expect(page).to have_content('$ 40')
      expect(page).to have_content('Action')
      expect(page).to have_link('Delete', href: "/recipe_foods/delete/#{@ingredient1.id}")
    end
  end
end
