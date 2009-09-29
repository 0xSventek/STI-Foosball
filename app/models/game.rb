class Game < ActiveRecord::Base
    validates_numericality_of :team_a_score
    validates_numericality_of :team_b_score
    has_and_belongs_to_many :players, :join_table => "players_games"
    
    named_scope :recent, :limit => 5, :order => "created_at desc"
    
    def team_a
      Player.find(:all, 
        :conditions => ["pg.game_id = ? AND pg.team = 'a'",self.id], 
        :joins      => "inner join players_games as pg on players.id = pg.player_id")
    end
    
    def team_b
      Player.find(:all, 
        :conditions => ["pg.game_id = ? AND pg.team = 'b'",self.id], 
        :joins      => "inner join players_games as pg on players.id = pg.player_id")
    end
end
