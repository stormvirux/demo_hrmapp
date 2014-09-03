class CreateAllowances < ActiveRecord::Migration
  def change
    create_table :allowances do |t|
      t.string :empno
      t.decimal :amount
      t.string :type
      t.references :payroll

      t.timestamps
    end
    add_index :allowances, :payroll_id
  end
end
