require 'rails_helper'

RSpec.feature "user adds a course process", type: :feature do
  scenario 'user adds a course' do

    # arrange
    user = FactoryBot.create(:user)
    category = FactoryBot.create(:category)

    visit '/'
    
    click_on 'Sign in'

    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password

    click_on 'Log in'
    
    visit '/users/edit'

    attach_file('Upload profile picture', Rails.root + 'spec/fixtures/images/test_picture.png', :match => :prefer_exact)
    fill_in 'Current password', :with => user.password, :match => :prefer_exact

    # act    
    click_on 'Update', :match => :prefer_exact

    # assert
    expect(user.avatar).not_to be_nil
    expect(page).to have_text("Success Your account has been updated successfully.")
  end
end
