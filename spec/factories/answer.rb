FactoryGirl.define do

  factory :answer do
    association :question, factory: :question
    body Faker::Lorem.sentence
  end

end

# FactoryGirl.create(:answer) >> # create question then create answer assicated with that question

# question = FactoryGirl.create(:question)
# FactoryGirl.create(:answer, question: question)


# let(:question) { build(:question) }