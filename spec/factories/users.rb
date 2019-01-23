FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "jdoe#{n}" }
    sequence(:email) { |n| "jdoe#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
