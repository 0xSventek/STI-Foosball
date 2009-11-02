# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def name_link(text,player_id)
    link_to text, {:controller => :player, :action => :show, :id => player_id}, {:class => "player_link"}
  end
end
