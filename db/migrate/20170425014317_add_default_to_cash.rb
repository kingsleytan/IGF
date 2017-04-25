class AddDefaultToCash < ActiveRecord::Migration[5.0]
  def change
    change_column :cashes, :amount, :integer, default: 0
  end
end
