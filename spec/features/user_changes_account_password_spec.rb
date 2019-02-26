require 'rails_helper'

RSpec.feature "user changes account password process", type: :feature do
  scenario 'user changes account password' do

    # arrange
    user = FactoryBot.create(:user)
    category = FactoryBot.create(:category)

    visit '/'
    
    click_on 'Sign in'

    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password

    click_on 'Log in'
    
    visit '/users/edit'

    fill_in 'Password', :with => '123456isntstrong', :match => :prefer_exact
    fill_in 'Password confirmation', :with => '123456isntstrong', :match => :prefer_exact
    fill_in 'Current password', :with => user.password, :match => :prefer_exact

    # act    
    click_on 'Update', :match => :prefer_exact

    # assert
    expect(page).to have_text("Success Your account has been updated successfully.")
  end
end
