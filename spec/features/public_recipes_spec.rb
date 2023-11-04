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
        Recipe.create(name: 'Pulled Pork', preparation_time: 1, cook_time: 8, description: text, user_id: @user.id)
      @recipe2 =
        Recipe.create(name: 'Smoked Beef', preparation_time: 1, cook_time: 8,
                      description: text, user_id: @user.id, public: true)
      @id = @recipe2.id
      @ingredient1 = RecipeFood.create(quantity: 2, food_id: @food1.id, recipe_id: @id)
      @ingredient2 = RecipeFood.create(quantity: 2, food_id: @food2.id, recipe_id: @id)
      login_as(@user, scope: :user)
      visit '/public_recipes'
    end

    it 'should only show the title and public recipe' do
      expect(page).to have_content('Public Recipes')
      expect(page).to have_content("#{@recipe2.name} by #{@user.name}")
      expect(page).to have_content(text)
      expect(page).to have_content('The total price is $50')
      expect(page).to_not have_content("#{@recipe1.name} by #{@user.name}")
    end

    it 'should test the links in the page to see if they work' do
      expect(page).to have_link(@recipe2.name, href: "/recipes/#{@recipe2.id}")
    end
  end
end
