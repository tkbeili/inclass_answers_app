FactoryGirl.define do
  factory :like do
    association :question, factory: :question
    association :user, factory: :user
  end
end