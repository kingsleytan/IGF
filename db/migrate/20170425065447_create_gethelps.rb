class CreateGethelps < ActiveRecord::Migration[5.0]
  def change
    create_table :gethelps do |t|
      t.integer :user_id
      t.integer :pair_user_id
      t.integer :amount

      t.timestamps
    end
  end
end
