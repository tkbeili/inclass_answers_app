json.array! @questions do |question|
  json.title question.title
  json.body question.body
  json.url question_url(question)
  json.create_date question.created_at.strftime("%Y - %B - %d")
end