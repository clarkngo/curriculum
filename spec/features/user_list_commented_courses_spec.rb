require 'rails_helper'

RSpec.feature "list commented course by current user process", type: :feature do
  scenario 'list commented course by current user' do

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

    visit course_path(course)

    fill_in("Add a Comment", with: "The course was well-designed and the instructor was great!")
    
    click_on "Add a Comment"

    # act    
    visit dashboard_index_path

    # assert
    expect(page).to have_text("The course was well-designed and the instructor was great!")
  end
end
