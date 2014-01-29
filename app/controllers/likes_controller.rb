class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    question = Question.find(params[:question_id])
    if question.like_by current_user
      redirect_to question, notice: "Thanks for liking"
    else
      redirect_to question, alert: "Sorry! problem happened"
    end
  end

  def destroy
    question = Question.find(params[:question_id])
    if question.unlike_by current_user
      redirect_to question, notice: "Y U NO LIKY!!"
    else
      redirect_to question, alert: "Sorry! problem happened"
    end
  end

end
