FactoryBot.define do
  factory :course do
    category {FactoryBot.create(:category)}
    name {'Intro to Machine Learning'}
    description {'This course is an intro to machine learning.'}
    user {FactoryBot.create(:user)}
  end
end
