class CreateMicromessages < ActiveRecord::Migration[5.1]
  def change
    create_table :micromessages do |t|
      t.text :body

      t.timestamps
    end
  end
end
