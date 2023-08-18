class AddNotoutToBattings < ActiveRecord::Migration[7.0]
  def change
    add_column :battings, :notout, :integer
  end
end
