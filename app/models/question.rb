class Question < ApplicationRecord
  has_and_belongs_to_many :exams
  has_many :choices, dependent: :destroy
  has_many :user_answers
  accepts_nested_attributes_for :choices, allow_destroy: true
  def correct_choice
    choices.find_by(correct: true)
  end
end
