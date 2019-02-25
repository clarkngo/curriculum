require 'rails_helper'

RSpec.feature "user deletes a course process", type: :feature do
  scenario 'user deletes a course' do

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

    click_on 'Courses'

    # act    
    click_on 'Delete'

    # assert
    expect(page).to have_text("Successfully deleted a course!")
  end
end
