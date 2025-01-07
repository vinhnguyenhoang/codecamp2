class AddTimesToUserAnswers < ActiveRecord::Migration[7.2]
  def change
    add_column :user_answers, :times, :integer
  end
end
