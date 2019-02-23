require 'rails_helper'

describe CoursePolicy do
  subject { CoursePolicy }

  context "for a visitor" do
    user = nil
    category = FactoryBot.create(:category)
    course = Course.create(
      category: category,
      name: 'Intro to AI',
      description: 'This course is an intro to AI.',
      user: user
    )

    permissions :index?, :show?, :new?, :edit?, :create?, :update?, :destroy do
      it "does not grant access for non logged in visitors" do
        expect(subject).not_to permit(user, course)
      end
    end
  end
end
