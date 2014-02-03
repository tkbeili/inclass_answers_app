class AnswerMailer < ActionMailer::Base
  default from: "answerawesome@gmail.com"

  def notify_owner answer
    @answer         = answer
    @sending_user   = @answer.user
    @question       = @answer.question
    @receiving_user = @question.user
    mail(to: @receiving_user.email, subject: "You've received new answer for your question #{@question.title.truncate(25)}")
  end

end