require 'rails_helper'

RSpec.feature "user creates chatroom process", type: :feature do
  scenario 'user creates chatroom' do

    # arrange
    user = FactoryBot.create(:user)

    visit '/'
    
    click_on 'Sign in'

    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password

    click_on 'Log in'

    click_on "Chatroom"

    click_on "New chat room"

    fill_in("Topic", with: "#test")
    
    # act    
    click_on "Add!"

    # assert
    expect(page).to have_text("Success Chatroom added!")
  end
end
