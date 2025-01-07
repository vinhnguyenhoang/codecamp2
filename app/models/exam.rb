class Exam < ApplicationRecord
  has_and_belongs_to_many :questions
  has_many :user_exams, dependent: :destroy
end
