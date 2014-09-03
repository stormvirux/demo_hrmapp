class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :allowances, :type, :atype
  end
end
