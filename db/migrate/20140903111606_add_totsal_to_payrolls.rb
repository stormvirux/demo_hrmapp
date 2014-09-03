class AddTotsalToPayrolls < ActiveRecord::Migration
  def change
    add_column :payrolls, :totsal, :decimal
  end
end
