class ChangeDefaultAmountToGethelp < ActiveRecord::Migration[5.0]
  def change
    change_column :gethelps, :amount, :integer, default: 1000
  end
end
