class CreateTheories < ActiveRecord::Migration[5.1]
  def change
    create_table :theories do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
