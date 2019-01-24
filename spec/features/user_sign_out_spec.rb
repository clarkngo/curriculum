require 'rails_helper'

RSpec.feature "user sign out process", type: :feature do
  scenario 'user sign out' do
    # arrange
    user = create(:user)

    visit '/users/sign_in'
    
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    # act
    click_on 'Sign out'

    # assert
    expect(page).to have_content 'Success Signed out successfully.'
  end
end
