require 'rails_helper'

RSpec.feature 'Food List Page Elements', type: :feature do
  describe 'Foodlist page with 1 food item on the list' do
    before(:each) do
      @user = User.create!(name: 'user', email: 'test@example.com', password: 'f4k3p455w0rd')
      @user.confirmed_at = Time.now
      @food1 = Food.create(name: 'Beef Ribs', measurement_unit: 'Kilograms', price: 10, quantity: 1, user_id: @user.id)
      login_as(@user, scope: :user)
      visit '/foods'
    end

    context 'All All page elements show' do
      it 'should show the name of each column and the corresponding Food value' do
        expect(page).to have_content('Name')
        expect(page).to have_content('Beef Ribs')
        expect(page).to have_content('Quantity')
        expect(page).to have_content(1)
        expect(page).to have_content('Measurement unit')
        expect(page).to have_content('Kilograms')
        expect(page).to have_content('Price')
        expect(page).to have_content(10)
        expect(page).to have_content('Action')
      end

      it 'should test the links in the page to see if they work' do
        expect(page).to have_link('Delete', href: "/foods/delete/#{@food1.id}")
        expect(page).to have_link('Add food', href: '/foods/new')
      end
    end
  end
end
