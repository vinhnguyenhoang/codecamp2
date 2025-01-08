class Exam < ApplicationRecord
  has_and_belongs_to_many :questions
  has_many :user_exams, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true
end
