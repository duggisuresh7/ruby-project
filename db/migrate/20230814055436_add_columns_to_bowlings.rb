class AddColumnsToBowlings < ActiveRecord::Migration[7.0]
  def change
    add_column :bowlings, :strikerate, :string
    add_column :bowlings, :avg, :string
    add_column :bowlings, :economy, :string
  end
end
