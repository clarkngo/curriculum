require 'rails_helper'

RSpec.feature "user updates a course process", type: :feature do
  scenario 'user updates a course' do

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

    click_on 'Edit'

    fill_in("Name", with: "Intro to C++", :match => :prefer_exact)
    fill_in("Description", with: "This course is an intro to C++.", :match => :prefer_exact)

    # act    
    click_on "Submit!", :match => :prefer_exact

    # assert
    expect(page).to have_text("Course was succesfully updated.")
  end
end
