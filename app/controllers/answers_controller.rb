class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question
  before_action :set_answer, only: [:destroy]

  def create
    @answer = current_user.answers.new answer_attributes
    
    @answer.question = @question
    respond_to do |format|
      if @answer.save
        AnswerMailer.delay.notify_owner(@answer)
        format.html { redirect_to @question, notice: "Thanks for your comment" }
        format.js   { render }
      else
        format.html { render "questions/show" }
        format.js   { render :new }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @answer.destroy
        format.html { redirect_to @question, notice: "Answer deleted successfully." }
        format.js   { render }
      else
        flash.now[:alert] = "We couldn't delete the answer"
        format.html { render "/questions/show" }
      end
    end
  end

  private

  def answer_attributes
    params.require(:answer).permit(:body)
  end

  def set_answer
    @answer = current_user.answers.find(params[:id])
  end

  def set_question
    @question = Question.friendly.find params[:question_id]
  end

end
