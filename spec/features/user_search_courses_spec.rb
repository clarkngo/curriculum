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
    
    fill_in 'term', :with => "Intro"

    # act    
    click_on 'Search'

    # assert
    expect(page).to have_text("Intro to AI")
  end
end
