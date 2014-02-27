FactoryGirl.define do

  factory :question do
    sequence(:title){|n| "#{Faker::Lorem.sentence} #{n}" }
    body Faker::Lorem.sentence
  end

end