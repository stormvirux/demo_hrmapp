class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :leave
      t.string :cur

      t.timestamps
    end
  end
end
