class Player < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  # TODO
  # has many through player_games
  has_and_belongs_to_many :games, :join_table => "players_games"
  
  named_scope :top_5, :limit => 5, :order => "rating desc" 
  
  def full_name
    self.first_name + " " + self.last_name
  end
  
  def game_data(options = {})
    data_limit      = options[:limit].blank? ? nil : options[:limit]
    data_conditions = options[:game_id].blank? ? \
                        ["player_id = ?",self.id] : \
                        ["game_id = ? AND player_id = ?",options[:game_id],self.id]
                        
    PlayersGame.find(:all, :conditions => data_conditions, :order => "created_at desc", :limit => data_limit)
  end
  
  def streak
    games       = PlayersGame.find(:all, :conditions => {:player_id => self.id}, :order => "created_at desc")
    last_result = games[0].rating_in > games[0].rating_out 
    lcv         = 1
    streak      = {}
    
    while (!games[lcv].blank? ) && ((games[lcv][:rating_in] > games[lcv][:rating_out]) == last_result )
      lcv += 1
    end

    streak[:count] = lcv
    
    last_result ? streak[:result] = "L" : streak[:result] = "W"
    
    streak
  end
  
  def sparkline_values
    pg =  PlayersGame.find( :all, 
                            :select => "rating_out", 
                            :conditions => ["player_id = ?", self.id], 
                            :limit => 20, 
                            :order => "created_at asc")
    
    max = Player.maximum('rating')
    min = Player.minimum('rating')
    
    out_strong = ""
    
    pg.each_with_index do |g,i|
      out_strong += ((g.rating_out - min).to_f/(max - min).to_f * 100.0).to_i.to_s
      unless (i + 1) == pg.size
        out_strong += ","
      end
    end
    
    out_strong
  end
  
end
