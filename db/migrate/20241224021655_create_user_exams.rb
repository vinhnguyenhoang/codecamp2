class CreateUserExams < ActiveRecord::Migration[7.2]
  def change
    create_table :user_exams do |t|
      t.references :user, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true
      t.integer :score
      t.string :status
      t.datetime :start_time

      t.timestamps
    end
  end
end
