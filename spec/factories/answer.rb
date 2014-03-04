FactoryGirl.define do

  factory :answer do
    association :question, factory: :question
    body Faker::Lorem.sentence
  end

end