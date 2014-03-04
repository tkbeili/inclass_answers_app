json.(@question, :title, :body, :id)
json.answers @question.answers do |answer|
  json.id answer.id
  json.body answer.body
end
# http://awesome_answers.dev/api/v1/questions/881

