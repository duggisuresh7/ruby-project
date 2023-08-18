class AddColumnsToBattings < ActiveRecord::Migration[7.0]
  def change
    add_column :battings, :strikerate, :float
    add_column :battings, :avg, :float
  end
end
