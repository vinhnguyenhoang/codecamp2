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
    question_data = question_params
    choices_data = question_data[:choices]
    @question = Question.new(content: question_data[:content])
    if choices_data.keys.length < 2
      flash[:alert] = "You must provide at least 2 choices."
      render :new
      return
    end
    choices_data.each do |_key, choice|
      @question.choices.build(
        content: choice[:content],
        correct: choice[:correct] == 'on'
      )
    end
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
      choices: [:content, :correct]
    )
  end

  def require_admin
    redirect_to admin_questions_path unless current_user&.admin? && current_user
  end

end
