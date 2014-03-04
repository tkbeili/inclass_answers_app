class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question, only: [:edit, :update]

  def index
    @questions = Question.page(params[:page]).per_page(4)
    respond_to do |format|
      format.html { render }
      format.json { render json: @questions.all }
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.new question_params
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end

  def show
    @question = Question.friendly.find(params[:id])
    @answer   = Answer.new
  end

  def edit
    
  end

  def update
    if @question.update_attributes question_params
      redirect_to @question, notice: "Question updated successfully."
    else
      render :edit
    end
  end

  private

  def question_params
    params.require(:question).permit([:title, :body, {category_ids: []}])
  end

  def set_question
    @question = current_user.questions.friendly.find(params[:id])
  end

end