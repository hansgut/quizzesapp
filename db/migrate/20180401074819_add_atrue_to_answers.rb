class AddAtrueToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :atrue, :boolean
  end
end
