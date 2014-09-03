class CreateDeductions < ActiveRecord::Migration
  def change
    create_table :deductions do |t|
      t.string :empno
      t.decimal :amount
      t.string :type
      t.string :dedtype
      t.references :payroll

      t.timestamps
    end
    add_index :deductions, :payroll_id
  end
end
