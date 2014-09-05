class AddNameToLeaveroll < ActiveRecord::Migration
  def change
    add_column :leaverolls, :name, :string
  end
end
