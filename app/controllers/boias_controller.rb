class BoiasController < ApplicationController
    # GET /controle_de_extintors
    # GET /controle_de_extintors.json
    
    def index
      
    
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @boias }
      end
    end
    
    def import
      Boia.import(params[:file])
      redirect_to admin_controlede_boias_path, notice: "Extintores importados."
    end
end




