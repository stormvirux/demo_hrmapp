class CreateLeavetypes < ActiveRecord::Migration
  def change
    create_table :leavetypes do |t|
      t.string :ltype

      t.timestamps
    end
  end
end
