class RemoveCountColumnFromUserAttendance < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_attendances, :count, :integer
  end
end
