FactoryGirl.define do

  factory :question do
    sequence(:title){|n| "#{Faker::Lorem.sentence} #{n}" }
    body Faker::Lorem.sentence
  end

  factory :invalid_question, parent: :question do
    title ""
  end


end