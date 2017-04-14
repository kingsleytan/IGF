class DropUserAttendance1 < ActiveRecord::Migration[5.0]
  def change
    drop_table :user_attendances
  end
end
