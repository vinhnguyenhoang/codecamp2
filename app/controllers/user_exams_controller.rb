class UserExamsController < ApplicationController
  def index
    @user_exams = UserExam.all
  end
  def show
    @user_exam = UserExam.find(params[:id])
  end
  def create
    @exam = Exam.find(params[:user_exam][:exam_id])
    @user_exam = current_user.user_exams.find_or_initialize_by(exam: @exam)
    @user_exam.start_time = Time.now
    @user_exam.save
    return redirect_to admin_exams_path, alert: 'Your exam submit fail!' unless @user_exam.save
    answers = params.require(:user_exam).permit(answers: {}).fetch(:answers, {})
    UserExam.save_answer(@user_exam, answers)
    @user_exam.score = calculate_score(@user_exam)
    @user_exam.status = "submitted"
    @user_exam.save!
    redirect_to user_exam_path(@user_exam), notice: 'Your exam has been submitted!'
  end

  private

  def calculate_score(user_exam)
    correct_answers = 0
    user_exam.user_answers.each do |user_answer|
      correct_answers += 1 if user_answer.choice.correct?
    end
    correct_answers
  end
end
