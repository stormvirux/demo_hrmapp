class AddDedperdayToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :dedperday, :decimal
  end
end
