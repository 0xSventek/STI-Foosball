class PlayerController < ApplicationController
  def new
    if request.post?
      p = Player.new(params[:player])
      
      if p.save
        flash[:success] = "Player added."
        redirect_to :action => :new
      else
        flash[:error] = "Player not added."
        redirect_to :action => :new
      end
    end
  end

  def show
  end

  def edit
  end

end
