class CreateBattings < ActiveRecord::Migration[7.0]
  def change
    create_table :battings do |t|
      t.string :format
      t.integer :matches
      t.integer :innings
      t.integer :runs
      t.integer :balls
      t.integer :highest
      t.integer :fours
      t.integer :sixes
      t.integer :fif
      t.integer :hun
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
