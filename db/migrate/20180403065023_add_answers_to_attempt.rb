class AddAnswersToAttempt < ActiveRecord::Migration[5.1]
  def change
    add_column :attempts, :answers, :text
  end
end
