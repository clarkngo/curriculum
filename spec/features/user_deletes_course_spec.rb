require 'rails_helper'

RSpec.feature "user sign in process", type: :feature do
  scenario 'user sign in' do
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

    click_on 'Destroy'
    expect(page).to have_content 'Success'
  end
end
