class RankingsController < ApplicationController
  def index
    @players = Player.find(:all, :order => "rating desc")
  end

end
