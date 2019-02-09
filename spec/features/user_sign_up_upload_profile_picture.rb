require 'rails_helper'

RSpec.feature "user signup process", type: :feature do
  scenario 'user signup' do
    # arrange
    visit "/users/sign_up"
    
    fill_in 'Email', with: 'jdoe@example.com'
    # cannot use Password because it appears in Password Confirmation
    fill_in 'user_password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    attach_file('Image', '/assets/images/test_profile_picture.png')

    # act
    click_button 'Sign up'

    # assert
    expect(page).to have_content 'Success Welcome! You have signed up successfully.' 
  end
end
