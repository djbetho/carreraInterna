class PostulationController < ApplicationController
  def index
      @oferta_id = Reaction.where(btouser_id: current_btouser.id)
    
  end
end
