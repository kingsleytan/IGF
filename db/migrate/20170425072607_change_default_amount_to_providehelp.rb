class ChangeDefaultAmountToProvidehelp < ActiveRecord::Migration[5.0]
  def change
    change_column :providehelps, :amount, :integer, default: 1000
  end
end
