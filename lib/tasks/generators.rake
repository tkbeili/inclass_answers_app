namespace :generators do

  desc "Generate random questions and answers associated with them"
  task :question_and_answers => :environment do
    number_of_questions = ENV['number_of_questions'] ? ENV['number_of_questions'].to_i : 50
    number_of_answers   = ENV['number_of_answers']   ? ENV['number_of_answers'].to_i   : 10

    number_of_questions.times do
      question = Question.create(title: Faker::Lorem.sentence(10), body: Faker::Lorem.sentence(50))
      number_of_answers.times do
        question.answers.create(body: Faker::Lorem.sentence(12))
      end
    end

    puts "Generated #{number_of_questions} question with #{number_of_answers} answers each"
  end

  desc "Generate default categories"
  task :default_categories => :environment do
    ["Technology", "Sports", "Entertainment", "Travel", 
      "Photography","Food", "Cars", "Programming", "Design", "Investing", 
      "Real Estate"].each do |category_name|
        Category.create(name: category_name)
      end
  end

end