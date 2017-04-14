class CreateTurnouts < ActiveRecord::Migration[5.0]
  def change
    create_table :turnouts do |t|
      t.integer :location, default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end
