require 'rails_helper'

RSpec.feature "user deletes account process", type: :feature do
  scenario 'user deletes account' do

    # arrange
    user = FactoryBot.create(:user)
    category = FactoryBot.create(:category)

    visit '/'
    
    click_on 'Sign in'

    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password

    click_on 'Log in'
    
    visit '/users/edit'

    fill_in 'Current password', :with => user.password, :match => :prefer_exact

    # act    
    click_on 'Cancel my account', :match => :prefer_exact

    # assert
    expect(User.first.present?).to eq(false)
    expect(page).to have_text("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
  end
end
