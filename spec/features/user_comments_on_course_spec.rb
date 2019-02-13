require 'rails_helper'

RSpec.feature "user adds a comment on a course process", type: :feature do
  scenario 'user adds a comment on a course' do

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

    fill_in("Add a Comment", with: "The course is way too advanced for me.")

    # act    
    click_on "Add a Comment"

    # assert
    expect(page).to have_text("Successfully added a comment!")
  end

  scenario 'user adds an empty comment on a course with' do

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

    fill_in("Add a Comment", with: "")

    # act    
    click_on "Add a Comment"

    # assert
    expect(page).to have_text("Unable to add blank comment!")
  end  
end
