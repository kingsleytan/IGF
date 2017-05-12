class AddTransferAmountToProvidehelp < ActiveRecord::Migration[5.0]
  def change
    add_column :providehelps, :transfer_amount, :integer
  end
end
