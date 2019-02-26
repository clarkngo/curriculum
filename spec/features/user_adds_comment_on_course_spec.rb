require 'rails_helper'

RSpec.feature "user adds a comment on course process", type: :feature do
  scenario 'user adds a comment on course' do

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

    click_on 'Show'

    fill_in("Add a Comment", with: "Does this cover Machine Learnings?", :match => :prefer_exact)

    # act    
    click_on 'Add a Comment'

    # assert
    expect(page).to have_text("Successfully added a comment!")
  end
end
