class CreateLeaverolls < ActiveRecord::Migration
  def change
    create_table :leaverolls do |t|
      t.string :empno
      t.string :ltype
      t.date :lfrom
      t.date :lto
      t.integer :totdays
      t.text :notes
      t.boolean :approved

      t.timestamps
    end
  end
end
