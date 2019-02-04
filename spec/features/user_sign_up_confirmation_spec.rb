require 'rails_helper'

RSpec.feature "user signup process confirmation", type: :feature do
  scenario 'user signup' do
    # arrange
    @user = FactoryBot.build(:user)
    visit root_path

    click_link "Sign up"
    
    fill_in "Email", :with => @user.email
    fill_in "Password", :with => @user.password
    fill_in "Password confirmation", :with => @user.password

    # act
    click_button 'Sign up'

    # assert
    expect(page).to have_content 'Success A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.' 
  end
end
