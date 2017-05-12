class ChangePairUserToProvidehelp < ActiveRecord::Migration[5.0]
  def change
    remove_column :providehelps, :pair_user_id, :integer
    add_column :providehelps, :transfer_user_id, :integer, default: 0
  end
end
