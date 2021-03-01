ActiveAdmin.register Viagem do
#  config.xlsx_builder.delete_columns :id, :created_at, :updated_at
  permit_params :fim_viagem, :inicio_viagem, :navio_id, :trecho_id, :previsao, :mapa_de_conves, :inventario, :mapa_de_conves2, :mapa_de_conves3, :siget, :carregamento_ids, :carregamentos_attributes, :inventario, :email_enviado

  actions :all, :except => :destroy
  batch_action :destroy, false

  scope :abertas


  controller do
    def show
      @viagem = Viagem.includes(versions: :item).find(params[:id])
      @versions = @viagem.versions
      @viagem = @viagem.versions[params[:version].to_i].reify if params[:version]
      show! #it seems to need this
    end
  end

  #sidebar :historico_dados, :partial => "layouts/version", :only => :show


     index do
      render "testes"
    column :navio do |viagem|
      viagem.navio.name if !viagem.navio.blank?
    end
    column :siget

        column "Inicio Viagem",:inicio_viagem, :sortable => :inicio_viagem do |viagem|
        viagem.inicio_viagem.strftime('%d/%m/%Y %H:%M')
        end

    column "Trecho" do |viagem|
      status_tag(viagem.trecho.name)
    end

    column "Fim de Viagem",:fim_viagem, :sortable => :fim_viagem do |viagem|
      if viagem.fim_viagem
      viagem.fim_viagem.strftime('%d/%m/%Y %H:%M')
    else
       "viajando"
    end
    end
    column "Tempo decorrido" do |viagem|
      div do
        render(:partial => "/layouts/tempoviagem2", :locals => {:viagem => viagem})
      end
    end
    column "Previsao de Chegada",:previsao, :sortable => :previsao do |viagem|
      viagem.previsao.strftime('%d/%m/%Y %H:%M') if viagem.previsao
    end
    #column "Alterar", :if => proc { current_user.can? :update, Viagem } do |viagem|
    #  render(:partial => "/layouts/alteraprevisao", :locals => {:viagem => viagem})
    #end

    default_actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Editar" do
        f.input :navio, :label => 'Empurrador', :as => :select, :collection => Navio.order("name ASC")
        f.input :inventario, :as => :file, :label => "Inventario de Equipamentos do Rebocador"
#        f.input :siget, :hint => "Preencha com os da viagem no siget separados por virgula", :placeholder => "Ex: 0000, 0001"
        f.input :trecho, :as => :radio, :hint => "Selecione o Trecho"
        f.input :previsao, :label => "Previsao do Radio", :hint => "Preencha com a data atualizada diariamento atravez do radio", :as => :datetime_picker
    if f.object.new_record?
        f.input :inicio_viagem, :label => "Inicio da Viagem", :hint => "Preencha com a data real do inicio", :as => :datetime_picker
      else
        unless !current_user.superadmin?
        f.input :inicio_viagem, :label => "Inicio da Viagem", :hint => "Preencha com a data real do inicio", :as => :datetime_picker
        end
      end
        f.input :fim_viagem, :label => "Fim da Viagem", :hint => "Preencha com o data real do fim da viagem", :as => :datetime_picker
    end

    f.action :submit, :button_html => { :label => "Salvar Registro", :class => "btn primary", :disable_with => 'Aguarde, atualizando informativo...' }
  end

  filter :navio, :as => :select, :collection => Navio.order("name ASC")
  filter :trecho, :as => :check_boxes
  filter :inicio_viagem



     show do |vigem|
      attributes_table do
        row :siget
        row :navio
        row("RPM") {|o| render "graficoviagem" }
        row :destino do
          viagem.trecho.destino
        end
        row "Inicio Viagem" do |v|
          if v.inicio_viagem != nil
            v.inicio_viagem.strftime('%d/%m/%Y %H:%M')
          end
        end
        row "Fim Viagem" do |v|
          if v.fim_viagem != nil
            v.fim_viagem.strftime('%d/%m/%Y %H:%M')
          end
        end
      row "Tempo decorrido" do |v|
        if v.fim_viagem != nil
         number_to_human(((v.fim_viagem-v.inicio_viagem)/3600).to_d, :significant_digits => 2)
       else
        number_to_human(((Time.zone.now-v.inicio_viagem)/3600).to_d, :significant_digits => 2)
      end
    end

        row "Previsao de Chegada" do |v|
          if v.previsao != nil
            v.previsao.strftime('%d/%m/%Y %H:%M')
          end
        end
        row "inventario" do |e|
                if e.inventario?
                  link_to("Ver inventario", e.inventario.url)
                end
        end
        row "status" do |v|
          link_to("Ver rastro da viagem", "#{posicoes_path}/#{v.id}")
        end
        #row("Detalhe") { render "graficoviagem" }
        row("Mensagens") {|o| render "mensagens" }
      end
      #active_admin_comments
    end

end
