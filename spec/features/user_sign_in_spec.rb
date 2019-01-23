require 'rails_helper'

RSpec.feature "user sign in process", type: :feature do
  scenario 'user sign in' do
    # arrange
    user = create(:user)

    visit '/users/sign_in'
    
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    # act
    click_on 'Log in'

    # assert
    expect(page).to have_content 'Success Signed in successfully.'
  end
end
