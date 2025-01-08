class Admin::QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :destroy, :show]
  before_action :require_admin, only: [:new, :create, :update, :edit, :destroy]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to admin_question_path(@question), notice: "Question was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_questions_path, notice: 'Question was successfully destroyed.'
  end



  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(
      :content,
      choices_attributes: [:content, :correct]
    ).tap do |question_params|
      if question_params[:choices_attributes]
        question_params[:choices_attributes].each do |choice|
          choice[:correct] = choice[:correct] == 'on' ? true : false
        end
      end
    end
  end

  def require_admin
    redirect_to admin_questions_path unless current_user&.admin? && current_user
  end

end
