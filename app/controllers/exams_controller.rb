class ExamsController < ApplicationController
  def index
    @exams = Exam.all
  end

  def show
    @exam = Exam.find(params[:id])
  end

  def new
    @questions = Question.all
  end

  def edit
    @exam = Exam.find(params[:id])
    @questions = Question.all
  end

  def update
    exam = Exam.find(params[:id])
    question_ids = params[:exam][:question_ids]
    exam.update(title: params[:exam][:title], duration: params[:exam][:duration])

    question_ids.each do |q_id|
      exam.questions << Question.find(q_id)
    end
    redirect_to admin_exams_path
  end

  def destroy
    @exam = Exam.find(params[:id])
    if @exam.destroy
      flash[:notice] = 'Exam was successfully deleted.'
    else
      flash[:alert] = 'Failed to delete exam.'
    end

    redirect_to admin_exams_path
  end

  def create
    question_ids = params[:exam][:question_ids]
    exam = Exam.new(title: params[:title], duration: params[:duration])
    if exam.save
      question_ids.each do |q_id|
        exam.questions << Question.find(q_id)
      end
      redirect_to admin_exams_path
    else
      render json: { error: "Unable to save exam" }, status: :unprocessable_entity
    end

  end
end
