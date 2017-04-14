class ChangeDefaultToAttendanceCount < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_attendances, :count, :integer
    add_column :user_attendances, :count, :integer, default: 1
  end
end
