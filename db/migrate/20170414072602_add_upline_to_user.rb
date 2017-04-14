class AddUplineToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :upline, :string
  end
end
