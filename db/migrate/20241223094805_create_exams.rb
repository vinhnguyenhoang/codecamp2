class CreateExams < ActiveRecord::Migration[7.2]
  def change
    create_table :exams do |t|
      t.string :title
      t.integer :duration

      t.timestamps
    end
  end
end
