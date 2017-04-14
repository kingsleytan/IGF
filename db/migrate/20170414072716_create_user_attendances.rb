class CreateUserAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :user_attendances do |t|
      t.integer :count, default: 0
      t.integer :location, default: 0

      t.timestamps
    end
  end
end
