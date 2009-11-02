class HomeController < ApplicationController
  def index
    @players      = Player.all
    @top_5        = Player.top_5
    @recent_games = Game.recent
    
    @win_streak    = {:count => 0, :player => nil}
    @lose_streak   = {:count => 0, :player => nil}
    
    @players.each do |p|
      
      unless p.games.blank?
        if p.streak[:result] == "W"
          if p.streak[:count] > @win_streak[:count]
            @win_streak[:count]  = p.streak[:count]
            @win_streak[:player] = p
          end
        else
          if p.streak[:count] > @lose_streak[:count]
            @lose_streak[:count]   = p.streak[:count]
            @lose_streak[:player]  = p
          end
        end
      end
    end
    
  end
end
