class UserAnswer < ApplicationRecord
  belongs_to :user_exam
  belongs_to :question
  belongs_to :choice
end
