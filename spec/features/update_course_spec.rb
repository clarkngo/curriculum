require 'rails_helper'

RSpec.feature "user sign in process", type: :feature do
  scenario 'user sign in' do

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

    visit edit_course_path(course)

    fill_in("Name", with: "Intro to C++")
    fill_in("Description", with: "This course is an intro to C++.")
    # act    
    click_on "Submit!"

    # assert
    expect(page).to have_text("Course was succesfully updated.")
  end
end
