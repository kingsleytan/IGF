class AddAmountDefaultToGethelp < ActiveRecord::Migration[5.0]
  def change
    change_column :gethelps, :amount, :integer, default: 0
  end
end
