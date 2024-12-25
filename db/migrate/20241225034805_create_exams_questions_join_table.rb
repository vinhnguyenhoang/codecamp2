class CreateExamsQuestionsJoinTable < ActiveRecord::Migration[7.2]
  def change
    create_table :exams_questions, id: false do |t|
      t.belongs_to :exam, null: false, foreign_key: true
      t.belongs_to :question, null: false, foreign_key: true
    end
  end
end
