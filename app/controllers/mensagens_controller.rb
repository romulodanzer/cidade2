class MensagensController < ApplicationController
 skip_before_filter :authenticate_user!, :only => [:feed]

  # GET /mensagens
  # GET /mensagens.json
  def novas
    @novas = []
    @brutas = Mensagem.nao_lidas.group(:navio_id)

    for mensagem in @brutas
      if !Navio.where("codigo_rastreador = ?", mensagem.navio_id).blank?
        @novas << {
                id: mensagem.id,
                navio: mensagem.navio.name,
                data: mensagem.messagetime.strftime("%d/%m %H:%M"),
                mensagem: mensagem.text[0..120]
              }
      end
    end

    respond_to do |format|
      format.json { render json: JSON.pretty_generate(@novas) }
    end
  end

  def feed
    @mensagens = Mensagem.last(100)
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  # GET /mensagens/1/edit
  def edit
    @mensagem = Mensagem.find(params[:id])
  end

  def update
    @mensagem = Mensagem.find(params[:id])

    respond_to do |format|
      if @mensagem.update_attributes(params[:mensagem])
        format.html { redirect_to @mensagem }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mensagem.errors, status: :unprocessable_entity }
      end
    end
  end

end
