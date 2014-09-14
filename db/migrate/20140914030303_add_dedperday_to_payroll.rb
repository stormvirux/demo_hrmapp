class AddDedperdayToPayroll < ActiveRecord::Migration
  def change
    add_column :payrolls, :dedperday, :decimal
  end
end
