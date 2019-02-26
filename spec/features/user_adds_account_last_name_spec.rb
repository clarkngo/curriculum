require 'rails_helper'

RSpec.feature "user adds a account last name process", type: :feature do
  scenario 'user adds a account last name' do

    # arrange
    user = FactoryBot.create(:user)
    category = FactoryBot.create(:category)

    visit '/'
    
    click_on 'Sign in'

    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password

    click_on 'Log in'
    
    visit '/users/edit'

    fill_in 'Last name', :with => 'Smith'
    fill_in 'Current password', :with => user.password, :match => :prefer_exact

    # act    
    click_on 'Update', :match => :prefer_exact

    # assert
    expect(User.first.last_name).to eq("Smith")
    expect(page).to have_text("Success Your account has been updated successfully.")
  end
end
