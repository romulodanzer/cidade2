ActiveAdmin.register Navio do
  menu :parent => "Cadastro"
    actions :all, :except => :destroy
    config.sort_order = "name_asc"
    config.per_page = 90
    batch_action :destroy, false

    permit_params :avatar, :id, :linha_id, :imo, :name, :rpm_config, :rpm_max, :rpm_min, :navio_id, :relatorio_de_radio, :gps, :bastao, :ais_confirm, :mmsi, :call_sign, :cameras, :cam_ini, :cam_fim, :camera_integrada, :codigos_siget, :potencia, :ab, :al, :pb, :comprimento, :boca, :pontal, :calado, :cts_min, :cts_max,
    :casc_e_est_validade_total,
    :casc_e_est_classificacao_inicial,
    :casc_e_est_manutencao_de_classe_mc1_abertura,
    :casc_e_est_manutencao_de_classe_mc1_fechamento,
    :casc_e_est_manutencao_de_classe_mc1_realizado,
    :casc_e_est_manutencao_de_classe_mc1_anexo,
    :casc_e_est_manutencao_de_classe_mc2_abertura,
    :casc_e_est_manutencao_de_classe_mc2_fechamento,
    :casc_e_est_manutencao_de_classe_mc2_realizado,
    :casc_e_est_manutencao_de_classe_mc2_anexo,
    :casc_e_est_manutencao_de_classe_mc3_abertura,
    :casc_e_est_manutencao_de_classe_mc3_fechamento,
    :casc_e_est_manutencao_de_classe_mc3_realizado,
    :casc_e_est_manutencao_de_classe_mc3_anexo,
    :casc_e_est_renovacao_de_classe_abertura,
    :casc_e_est_renovacao_de_classe_fechamento,
    :casc_e_est_renovacao_de_classe_realizado,
    :casc_e_est_renovacao_de_classe_anexo,
    :tipo_rastreador_id,
    :codigo_rastreador,
    :filial_id,
    :status

  index :download_links => true do

    column "Empurrador",:name
    column :status
    column :codigo_rastreador
    column "Linha" do |l|
      l.linha.name
    end
    column "Tipo Rastredor",:tipo_rastreador

    #column "Onde" do |t|
		#if t.viagens.count > 0
	#		if !t.viagens.last.blank?
#				if t.viagens.last.fim_viagem != nil
					#"Em #{t.viagens.last.trecho.destino}"
					#else
					#"Navegando para #{t.viagens.last.trecho.destino}"
				#end
			#	end
			#end

    #end
    #column "Posicao" do |navio|
    #
    #  navio.posicoes.last.landmark if navio.posicoes.last
    #  end
    #end
    #column "Onde" do |navio|
    #  posicao = navio.posicoes.last
    #  if !posicao.blank?
    #      posicao.landmark + ' em ' + posicao.positiontime.strftime('%d/%m/%Y %H:%M') if posicao
    #  else
    #    ''
    #  end

    #end

    #column "Previsao Chegada" do |navio|
    #  navio.viagens.last.previsao
    #end
     actions
  end


#filter :navio, :as => :select, :collection => Navio.find.all.order("name ASC")
filter :linha, :as => :check_boxes, :collection => Linha.all.order("name ASC")
#filter :posicao, :label => 'Parte da posicao'
filter :gps, :as => :check_boxes, :label => 'Tem gps?'
#filter :tipo_rastreador
#filter :bastao, :as => :check_boxes, :label => 'Tem bastao?'
#filter :cameras, :as => :check_boxes, :label => 'Cameras?'
#filter :camera_integrada, :as => :check_boxes, :label => 'Camera Integrada com Autotrac?'
filter :status, as: :check_boxes, :collection => %w[Ativo Inativo Parado Reativando]


#####################################
 form :html => { :multipart => true } do |f|
   f.inputs "Detalhes do Navio" do
     f.input :tipo_rastreador
     f.input :codigo_rastreador
     f.input :name, :label => "Empurrador"
     f.input :linha, :as => :radio
     f.input :filial, :as => :radio
     f.input :status, :as => :radio, :hint => "Selecione a situacao", :collection => %w[Ativo Inativo Reativando Parado]
     f.input :relatorio_de_radio
   end

   unless !current_user.superadmin?

  f.inputs "CFTV" do
     f.input :cameras,:label => "Cameras", :hint => "possui sistema de cameras instalado?"
     f.input :camera_integrada, :label => "Interligado no Autotrac", :hint => "possui ligacao no Autotrac para sensor de desligamento"
     #f.input :cam_ini,:label => "Inicio da Instalacao", :hint => "data de inicio das instalacoes das cameras", :as => :datetime_picker
     #f.input :cam_fim,:label => "Fim da Instalacao", :hint => "data de inicio da conclusao das instalacoes de cameras", :as => :datetime_picker
  end

  f.inputs "Equipamentos" do
     f.input :gps,:label => "GPS", :hint => "possui sistema de gps instalado?"
     #f.input :bastao,:label => "Bastao de Ronda", :hint => "possui sistema de gps instalado?"
     f.input :avatar, :as => :file
     f.input :rpm_config,:label => "Captacao de RPM", :hint => "Marque caso exista a captacao do mct"
     f.input :rpm_min, :hint => "Preencha com o RPM minimo de viagem"
     f.input :rpm_max, :hint => "Preencha com o RPM maximo de viagem"
   end

  end
   f.inputs "Documentos Gerais" do
    f.input :imo
    f.input :ais_confirm,:label => "Possui AIS"
    f.input :mmsi,:label => "MMSI", :hint => "Digite o numero do mmsi do rebocador registrado na anatel"
    f.input :call_sign,:label => "Call Sign", :hint => "Informe o numero de call sign do rebocador"
    #f.input :codigos_siget
    f.input :potencia
    f.input :ab
    f.input :al
    f.input :pb
    f.input :comprimento
    f.input :boca
    f.input :pontal
    f.input :calado
    f.input :cts_min
    f.input :cts_max
   end
   f.actions
 end

#######################


   show do |navio|
      attributes_table do
        row :id
        row :tipo_rastreador
        row :codigo_rastreador
        row :name
        row :linha
        row :status
        row :filial
        row :gps do |navio|
          if navio.gps == true
            "Instalado"
          else
            "Nao possui"
          end
        end
        row :ais_confirm do |navio|
          if navio.ais_confirm == true
            "Instalado"
          else
            "Nao possui"
          end
        end
        row :mmsi
        row :call_sign
        #row "Solicitacoes Pendentes" do |t|
      #    t.ordem_de_servicos.where("status NOT IN ('realizada', 'negada')").count
        #end
         # row "Ultima Descricao do GPS" do
        #    if navio.posicoes.count > 0
       #       div do
      #          navio.posicoes.last.positiontime.strftime('%d/%m/%Y')
     #         end
    #          div do
   #             navio.posicoes.last.landmark
  #            end
 #           end
#          end
        #  row "Info Atual" do
        #    if navio.viagens.count > 0
      #        if navio.viagens.last.fim_viagem != nil
      #          "Em " + navio.viagens.last.trecho.destino + " faz " + time_ago_in_words(navio.viagens.last.fim_viagem)
      #        else
      #          "Navegando para " + navio.viagens.last.trecho.destino + ", com previsao para daqui a " + distance_of_time_in_words(Time.now, navio.viagens.last.previsao, true)
      #        end

      #      end
    #      end
          #row("Movimentacao das Ultimas 4 horas") {|o| render "graficoultimas" }
      end
      #active_admin_comments
    end

end




#<td><%= navio.posicoes.last.landmark %> </td>
#    <td><%= navio.posicoes.last.positiontime.strftime('%d/%m/%Y %H:%M') %> </td>
