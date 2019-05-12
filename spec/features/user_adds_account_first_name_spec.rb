require 'rails_helper'

RSpec.feature "user adds a account first name process", type: :feature do
  scenario 'user adds a account first name' do

    # arrange
    user = FactoryBot.create(:user)
    category = FactoryBot.create(:category)

    visit '/'
    
    click_on 'Sign in'

    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password

    click_on 'Log in'
    
    visit '/users/edit'

    fill_in 'First name', :with => 'John'
    fill_in 'Current password', :with => user.password, :match => :prefer_exact

    # act    
    click_on 'Update', :match => :prefer_exact

    # assert
    expect(User.first.first_name).to eq("John")
    expect(page).to have_text("Success Your account has been updated successfully.")
  end
end
