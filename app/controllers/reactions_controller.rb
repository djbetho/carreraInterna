class ReactionsController < ApplicationController
    before_action :set_poost, only: %i[show edit update destroy]
    before_action :authenticate_btouser!
  
   
  
    def user_reaction
   
      @user = current_btouser 
      @type = params[:reaction_type]
      @offer = Offer.find(params[:offer_id]) if params[:offer_id]
      @kind = params[:kind]
  
      respond_to do |format|
       
        reactions = Reaction.find_by(btouser_id: @user.id, offer_id: @offer.id)
  
        if reactions
          format.html { redirect_to offers_path(@offer), notice: 'No puedes postular mas a este cargo solo una vez' }
        else
        
              @reaction = Reaction.new(btouser_id: @user.id, offer_id: @offer.id, reaction_type: @type, kind: @kind)
                  
              if @reaction.save
                format.html { redirect_to offers_path(@offer), notice: 'La postulacion  a sido creada' }
              else
                format.html { redirect_to offers_path(@offer), notice: 'algo malo paso' }
              end
            
        end
      end
    end
  
  end