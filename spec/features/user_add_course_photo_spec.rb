require 'rails_helper'

RSpec.feature "user add a course photo process", type: :feature do
  scenario 'user add a course photo' do

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

    fill_in("Name", with: "Intro to C++")
    fill_in("Description", with: "This course is an intro to C++.")
    attach_file('Upload course photo', Rails.root + 'spec/fixtures/images/test_picture.png')

    # act    
    click_on "Submit!"

    # assert
    expect(page).to have_text("Course was succesfully updated.")
    expect(Course.last.photo).not_to be_nil
  end
end
