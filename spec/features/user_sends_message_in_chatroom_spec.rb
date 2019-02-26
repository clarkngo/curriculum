require 'rails_helper'

RSpec.feature "user sends message in chatroom process", type: :feature do
  scenario 'user sends message in chatroom' do

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
    
    click_on "Add!"
    
    click_on "Enter #test"

    fill_in('message[content]', with: "I need help")

    # act    
    click_on "send"

    # assert
    expect(Message.first.content).to eq("I need help")
  end
end
