class CreatePayrolls < ActiveRecord::Migration
  def change
    create_table :payrolls do |t|
      t.string :empno
      t.string :name

      t.timestamps
    end
  end
end
