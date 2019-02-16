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
    click_on 'My Dashboard'

    # assert
    expect(page).to have_text("The course was well-designed and the instructor was great!")
  end

  scenario 'show course commented by current user' do

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

    click_on 'My Dashboard'

    # act    
    click_on 'Show Course'

    # assert
    expect(current_path).to eql(course_path(course))
  end  

  scenario 'edit comment by current user' do

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

    click_on 'My Dashboard'

    click_on 'Edit'

    fill_in("Message", with: "The course was well-designed and the instructor was superb!")

    # act    
    click_on 'Update'
    
    # assert
    expect(page).to have_text("Success Comment was succesfully updated.")
  end    

  scenario 'delete comment by current user' do

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

    click_on 'My Dashboard'

    # act    
    click_on 'Delete'
    
    # assert
    expect(page).to have_text("Success Successfully deleted a comment!")
  end      
end
