class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question
  before_action :set_answer, only: [:destroy]

  def create
    @answer = current_user.answers.new answer_attributes
    
    @answer.question = @question
    if @answer.save
      redirect_to @question, notice: "Thanks for your comment"
    else
      render "questions/show"
    end
  end

  def destroy
    if @answer.destroy
      redirect_to @question, notice: "Answer deleted successfully."
    else
      flash.now[:alert] = "We couldn't delete the answer"
      render "/questions/show"
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
    @question = Question.find params[:question_id]
  end

end
