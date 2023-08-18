class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :playername
      t.string :born
      t.string :birthplace
      t.string :nickname
      t.string :role
      t.string :battingstyle
      t.string :bowling
      t.string :style

      t.timestamps
    end
  end
end
