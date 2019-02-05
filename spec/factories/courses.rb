FactoryBot.define do
  factory :course do
    category { FactoryBot.create(:category) }
    name { "Intro to Computer Science" }
    description { "This course is an introduction to Computer Science" }    
    user { FactoryBot.create(:user)}
  end
end
