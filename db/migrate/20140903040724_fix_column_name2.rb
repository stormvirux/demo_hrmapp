class FixColumnName2 < ActiveRecord::Migration
   def change
    rename_column :deductions, :type, :dtype
  end
end
