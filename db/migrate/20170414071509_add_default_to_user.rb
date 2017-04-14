class AddDefaultToUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :role, :integer
    add_column :users, :role, :integer, default: 0
  end
end
