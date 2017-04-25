class CreateCashes < ActiveRecord::Migration[5.0]
  def change
    create_table :cashes do |t|
      t.integer :amount
      t.integer :user_id
      t.integer :transfer_user_id
      t.integer :transfer_amount

      t.timestamps
    end
  end
end
