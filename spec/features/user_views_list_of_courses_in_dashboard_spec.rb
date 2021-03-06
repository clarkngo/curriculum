require 'rails_helper'

RSpec.feature "user views list of courses in dashboard process", type: :feature do
  scenario 'user views list of courses in dashboard' do

    # arrange
    user = FactoryBot.create(:user)
    category = FactoryBot.create(:category)
    course = Course.create(
      category: category,
      name: 'Intro to AI',
      description: 'This course is an intro to AI.',
      user: user
    )

    visit '/'
    
    click_on 'Sign in'

    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password

    click_on 'Log in'
    
    # act    
    visit '/dashboard'

    # assert
    expect(page).to have_text("List of Courses")
  end
end
