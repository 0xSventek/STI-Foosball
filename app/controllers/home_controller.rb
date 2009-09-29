class HomeController < ApplicationController
  def index
    @players      = Player.all
    @top_5        = Player.top_5
    @recent_games = Game.recent
  end
end
