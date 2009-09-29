class Player < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  has_and_belongs_to_many :games, :join_table => "players_games"
  
  named_scope :top_5, :limit => 5, :order => "rating desc" 
  
  def full_name
    self.first_name + " " + self.last_name
  end
  
  def game_data(game_id)
    PlayersGame.find(:first, :conditions => ["game_id = ? AND player_id = ?",game_id,self.id])
  end
  
end
