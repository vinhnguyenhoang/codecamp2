class UserAnswer < ApplicationRecord
  belongs_to :user_exam
  belongs_to :question
  belongs_to :choice

  def correct?
    choice.correct?
  end
end
