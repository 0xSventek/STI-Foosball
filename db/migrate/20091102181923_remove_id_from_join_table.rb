class RemoveIdFromJoinTable < ActiveRecord::Migration
  def self.up
    remove_column :players_games, :id
  end

  def self.down
  end
end
