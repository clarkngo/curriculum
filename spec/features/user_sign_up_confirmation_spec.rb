require 'rails_helper'

RSpec.feature "user signup process confirmation", type: :feature do
  scenario 'user signup' do
    # arrange
    visit "/users/sign_up"
    
    fill_in 'Email', with: 'jdoe@example.com'
    # cannot use Password because it appears in Password Confirmation
    fill_in 'user_password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    # act
    click_button 'Sign up'

    # assert
    expect(page).to have_content 'Success A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.' 
  end
end
