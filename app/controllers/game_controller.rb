class GameController < ApplicationController
  def new
    @players = Player.all
    
    if request.post?
      errors        = []
      game          = Game.new
      players       = []
      player_games  = []
      
      4.times do |i|
        players[i]      = Player.find(params[:game]["player_#{i+1}_id"])
        player_games[i] = PlayersGame.new
      end
      
      
      # --------------------------------------------------------
      k 	= 100.0
    	elo = 5000.0
    	 
      team_a_rating = players[0].rating + players[1].rating
      team_b_rating = players[2].rating + players[3].rating
      
      team_a_result = (params[:team_a_score].to_i > params[:team_b_score].to_i) ? 1 : 0
      team_b_result = (params[:team_b_score].to_i > params[:team_a_score].to_i) ? 1 : 0
      
      team_a_expect = ((1+10**((team_b_rating-team_a_rating)/elo))**(-1)).to_f
      team_b_expect = ((1+10**((team_a_rating-team_b_rating)/elo))**(-1)).to_f
      
      team_a_change = (k * (team_a_result.to_f - team_a_expect)).to_i
      team_b_change = (k * (team_b_result.to_f - team_b_expect)).to_i
      # --------------------------------------------------------
      
      game.team_a_score = params[:team_a_score]
      game.team_b_score = params[:team_b_score]
      game.notes        = params[:notes] 
      
      if game.save
        
        4.times do |i|
          player_games[i].player_id = params[:game]["player_#{i+1}_id"]
          player_games[i].game_id   = game.id
          player_games[i].rating_in = players[i].rating
          
          if i < 2
            player_games[i].team        = 'a'
            player_games[i].rating_out  = players[i].rating + team_a_change.to_i
            players[i].update_attributes(:rating => player_games[i].rating_out, :w => (team_a_result == 1) ? (players[i].w + 1) : (players[i].w) , :l => (team_a_result == 0) ? (players[i].l + 1) : (players[i].l) )
          else
            player_games[i].team        = 'b'
            player_games[i].rating_out  = players[i].rating + team_b_change.to_i
            players[i].update_attributes(:rating => player_games[i].rating_out, :w => (team_b_result == 1) ? (players[i].w + 1) : (players[i].w) , :l => (team_b_result == 0) ? (players[i].l + 1) : (players[i].l) )
          end
          
          unless player_games[i].save
            errors << "Error saving player."
          end
        end
      else 
        errors << "Error saving game."
      end      
      
      if errors.size == 0
        redirect_to :action => :show, :id => game.id
      else
        flash[:error] = "Error saving game"
        redirect_to :action => :new
      end
         
    end
  end

  def show
    @game     = Game.find(params[:id])
  end
  
  def scoreboard
    @games = Game.find(:all, :order => "created_at desc")
  end

end
