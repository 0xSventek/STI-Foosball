class CreatePlayersGames < ActiveRecord::Migration
  def self.up
    create_table :players_games do |t|
      t.integer :player_id
      t.integer :game_id
      t.string  :team, :limit => 1
      t.integer :rating_in
      t.integer :rating_out
      t.timestamps
    end
  end

  def self.down
    drop_table :player_games
  end
end
