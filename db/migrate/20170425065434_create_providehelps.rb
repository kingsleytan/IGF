class CreateProvidehelps < ActiveRecord::Migration[5.0]
  def change
    create_table :providehelps do |t|
      t.integer :user_id
      t.integer :pair_user_id
      t.integer :amount, default: 0

      t.timestamps
    end
  end
end
