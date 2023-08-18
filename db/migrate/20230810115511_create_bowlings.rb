class CreateBowlings < ActiveRecord::Migration[7.0]
  def change
    create_table :bowlings do |t|
      t.string :format
      t.integer :matches
      t.integer :innings
      t.integer :balls
      t.integer :runs
      t.integer :maidens
      t.integer :wickets
      t.integer :fourw
      t.integer :fifw
      t.string :bbi
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
