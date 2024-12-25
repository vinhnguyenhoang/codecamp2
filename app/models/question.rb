class Question < ApplicationRecord
  has_and_belongs_to_many :exams
  has_many :choices, dependent: :destroy

  def correct_choice
    choices.find_by(correct: true)
  end
end
