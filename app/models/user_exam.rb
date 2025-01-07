class UserExam < ApplicationRecord
  belongs_to :user
  belongs_to :exam
  has_many :user_answers
  def self.save_answer(user_exam, answers, times)
    # user_exam.user_answers.destroy_all

    # Process each submitted answer
    answers.each do |question_id, choice_id|
      next if choice_id.blank?

      question = Question.find(question_id)
      choice = Choice.find(choice_id)

      # Create a new user_answer record
      user_exam.user_answers.create!(question:, choice:, times:)
    end
  end
end
