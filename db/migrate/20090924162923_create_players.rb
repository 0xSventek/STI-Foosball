class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :nick_name
      t.integer :rating, :default => 5000
      t.integer :w, :default => 0
      t.integer :l, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
