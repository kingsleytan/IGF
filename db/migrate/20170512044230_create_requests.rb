class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :pin_req, default: 0
      t.integer :cash_req, default: 0
      t.integer :user_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
