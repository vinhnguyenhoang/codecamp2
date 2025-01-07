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
    @user_exam.start_time = params[:user_exam][:start_time]
    @user_exam.submit_time = params[:user_exam][:submit_time]

    return redirect_to admin_exams_path, alert: 'Your exam submit fail!' unless @user_exam.save

    answers = params.require(:user_exam).permit(answers: {}).fetch(:answers, {})
    times = UserAnswer.where(user_exam_id: @user_exam.id).maximum(:times).to_i + 1
    UserExam.save_answer(@user_exam, answers, times)
    @user_exam.score = calculate_score(@user_exam)
    @user_exam.status = "submitted"
    @user_exam.save!

    redirect_to user_exam_path(@user_exam), notice: 'Your exam has been submitted!'
  end

  private

  def calculate_score(user_exam, times = -1)
    correct_answers = 0
    times = UserAnswer.where(user_exam_id: user_exam.id).maximum(:times) if times == -1
    user_exam.user_answers.each do |user_answer|
      if(user_answer.times == times)
        correct_answers += 1 if user_answer.choice.correct?
      end
    end
    ((correct_answers.to_i.to_f / user_exam.exam.questions.size) * 10).round
  end
end
