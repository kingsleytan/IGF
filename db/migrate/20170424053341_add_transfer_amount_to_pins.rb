class AddTransferAmountToPins < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :transfer_amount, :integer
  end
end
