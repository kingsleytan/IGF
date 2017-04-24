class CreatePins < ActiveRecord::Migration[5.0]
  def change
    create_table :pins do |t|
      t.integer :amount
      t.integer :user_id
      t.integer :transfer_user_id

      t.timestamps
    end
  end
end
