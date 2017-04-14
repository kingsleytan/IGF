class AddUserIdToUserAttendance < ActiveRecord::Migration[5.0]
  def change
    add_column :user_attendances, :user_id, :integer
  end
end
