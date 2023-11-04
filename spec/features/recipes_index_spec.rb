require 'rails_helper'

RSpec.feature 'Recipe List Page Elements', type: :feature do
  describe 'Foodlist page with 1 food item on the list' do
    before(:each) do
      @user = User.create!(name: 'user', email: 'test@example.com', password: 'f4k3p455w0rd')
      @user.confirmed_at = Time.now
      text = 'Smoked low-and-slow to slide-off-the-bone tender perfection.'
      @food1 = Food.create(name: 'Beef Ribs', measurement_unit: 'Kilograms', price: 10, quantity: 1, user_id: @user.id)
      @recipe1 =
        Recipe.create(name: 'Smoked Beef', preparation_time: 1, cook_time: 8, description: text, user_id: @user.id)
      login_as(@user, scope: :user)
      visit '/recipes'
    end

    it 'should show the elements of the recipe list page' do
      expect(page).to have_content('Recipe List')
      expect(page).to have_content(@text)
    end

    it 'should test the links in the page to see if they work' do
      expect(page).to have_link('Smoked Beef', href: "/recipes/#{@recipe1.id}")
      expect(page).to have_link('Add new Recipe', href: '/recipes/new')
      expect(page).to have_button('Remove')
    end
  end
end
