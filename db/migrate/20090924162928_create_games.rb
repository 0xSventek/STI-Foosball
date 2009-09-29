class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :team_a_score
      t.integer :team_b_score
      t.text    :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
