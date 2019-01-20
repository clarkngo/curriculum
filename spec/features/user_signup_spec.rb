require 'rails_helper'

RSpec.feature "user signup process", type: :feature do
  scenario 'user signup' do
    visit '/users/sign_up'

    click_button 'Sign up'
    fill_in 'Email', with: 'someone@example.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'

    expect(page).to have_content 'Success'
  end
end
