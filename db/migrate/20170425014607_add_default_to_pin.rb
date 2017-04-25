class AddDefaultToPin < ActiveRecord::Migration[5.0]
  def change
    change_column :pins, :amount, :integer, default: 0
  end
end
