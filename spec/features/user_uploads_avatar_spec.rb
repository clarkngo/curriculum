require 'rails_helper'

RSpec.feature "user upload profile picture process", type: :feature do
  scenario 'user upload profile picture' do
    # arrange
    visit root_path

    click_on 'Sign up'

    fill_in 'Email', with: 'jdoe@example.com'
    # cannot use Password because it appears in Password Confirmation
    fill_in 'user_password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    
    click_button 'Sign up'

    visit "/users/edit"
    
    fill_in 'Current password', with: 'password'
    attach_file('Upload profile picture', Rails.root + 'spec/fixtures/images/test_picture.png')

    # act
    click_button 'Update'

    # assert
    expect(User.last.avatar).not_to be_nil
    expect(page).to have_content 'Success Your account has been updated successfully.' 
  end
end
