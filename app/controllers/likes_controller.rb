class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_likable

  def create
    if @likable.likers << current_user
      redirect_to redirect_to_path, notice: "Thanks for liking"
    else
      redirect_to redirect_to_path, alert: "Sorry! problem happened"
    end
  end

  def destroy
    if @likable.likers << current_user
      redirect_to redirect_to_path, notice: "Y U NO LIKY!!"
    else
      redirect_to redirect_to_path, alert: "Sorry! problem happened"
    end
  end

  private

  def find_likable
    # likable_class = [Question, Answer].detect {|c| params["#{c.name.underscore}_id"] }
    # @likable      = likable_class.find(params["#{likable_class.name.underscore}_id"])
    @likable = if params.has_key? :question_id
                  Question.find(params[:question_id])
                elsif params.has_key? :answer_id
                  Answer.find(params[:answer_id])
                end
  end

  def redirect_to_path
    # if @likable.respond_to? :question
    #   @likable.question
    # else
    #   @likable
    # end
    case @likable
    when Question then @likable # Question === @likable
    when Answer then @likable.question
    end
  end

end
