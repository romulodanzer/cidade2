class ControleDeExtintoresController < ApplicationController
    # GET /controle_de_extintors
    # GET /controle_de_extintors.json
  
    def index
      
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @controle_de_extintores }
      end
    end
  
    def import
      ControleDeExtintor.import(params[:file])
      redirect_to admin_controlede_extintores_path, notice: "Extintores importados."
    end
  
  end
  