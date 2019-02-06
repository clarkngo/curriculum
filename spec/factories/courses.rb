FactoryBot.define do
  factory :course do
    category_id {'Preparatory'}
    name { "Intro to Computer Science" }
    description { "This course is an introduction to Computer Science" }    
    user_id {'someone4@example.com'}
  end
end
