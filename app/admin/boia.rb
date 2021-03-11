ActiveAdmin.register Boia, :as => "Controle de Boias"  do
menu :label => "Controle de Boias", :parent => "Sesmt"

permit_params :bujao, :classe, :corda_salva_vidas, :cordas_retinida, :embarcacao, :fabricacao, :fabricante, :fita_refletiva, :modelo, :n_de_serie, :tecnico, :tipo, :identificacao_rebocador, :observacao, :foto, :tipo_de_embarcacao, :validade, :localizacao, :responsavel_pela_embarcacao

scope :feito_hoje
scope :ultimos_7_dias
scope :este_mes


filter :embarcacao
filter :tecnico
filter :fabricante
filter :n_de_serie
filter :created_at, :label => "Vistoriado em"

controller do
 def index
  super do |format|
   format.html
   format.pdf { render(pdf: "page-hidrantes.pdf",:orientation => 'Landscape') }
  end
 end
  #  def create
  #    create! do |format|
  #      format.html { redirect_to admin_controlede_boia_path(resource, add_more: true) }
  #    end
  #  end
end


 # action_item :add, only: :show do
 #   link_to "New",  new_admin_controlede_boia_path if params['add_more'] == true
 # end


index download_links: [:pdf] do
  render "boias"

column :embarcacao do |t|
        if t.tipo_de_embarcacao?
                t.tipo_de_embarcacao + " " + t.embarcacao
        else
                t.embarcacao
        end
end

column :tipo
column :fabricante
column "Validade",:validade, :sortable => :validade do |v|
	if v.validade?
	if v.validade <= Date.today
        div do status_tag(v.validade.strftime('%d/%m/%Y'), class: 'error') end
      else
      if v.validade < Date.today+1.month
          div do status_tag(v.validade.strftime('%d/%m/%Y'), class: 'warning') end
      else
        div do status_tag(v.validade.strftime('%d/%m/%Y'), class: 'ok') end
      end
            end
	end
end
column :n_de_serie
column :classe
column "Itens",:created_at, :sortable => :created_at do |t|

        div do
        case t.corda_salva_vidas
        when 'N/A'
          status_tag("Corda Salva Vidas" + t.corda_salva_vidas, class: 'warning')
        when 'N/C'
          status_tag("Corda Salva Vidas" + t.corda_salva_vidas, class: 'error')
        when 'Ok'
         status_tag("Corda Salva Vidas" + t.corda_salva_vidas, class: 'ok')
        else
          ''
        end
		case t.cordas_retinida
        when 'N/A'
         status_tag("Cordas retinida: " + t.cordas_retinida, class: 'warning')
        when 'N/C'
         status_tag("Cordas retinida: " + t.cordas_retinida, class: 'error')
        when 'Ok'
         status_tag("Cordas retinida: " + t.cordas_retinida, class: 'ok')
        else
          ''
        end
        case t.fita_refletiva
        when 'N/A'
         status_tag("Fita Refletiva: " + t.fita_refletiva, class: 'warning')
        when 'N/C'
         status_tag("Fita Refletiva: " + t.fita_refletiva, class: 'error')
        when 'Ok'
         status_tag("Fita Refletiva: " + t.fita_refletiva, class: 'ok')
        else
          ''
        end

	if t.identificacao_rebocador?
	case t.identificacao_rebocador
	when 'N/A'
         status_tag("Identificação Rebocador: " + t.identificacao_rebocador, class: 'warning')
        when 'Não'
         status_tag("Identificação Rebocador: " + t.identificacao_rebocador, class: 'error')
        when 'Sim'
         status_tag("Identificação Rebocador: " + t.identificacao_rebocador, class: 'ok')
        else
          ''
        end
	end



	end
	div do
        case t.bujao
        when 'N/A'
          status_tag("Bujão" + t.bujao, class: 'warning')
        when 'N/C'
          status_tag("Bujão" + t.bujao, class: 'error')
        when 'Ok'
         status_tag("Bujão" + t.bujao, class: 'ok')
        else
          ''
        end
	if t.localizacao?
	status_tag("Localizacao: " + t.localizacao, class: 'ok')
	end
        status_tag("Técnico: " + t.tecnico, class: 'warning')
        status_tag("Verificado: " + t.created_at.to_formatted_s(:short), class: 'ok')
	end
	end
        column :observacao do |t|
		if !t.observacao.nil?
		div do
		t.observacao
		end
		end

		if t.foto?
		div do
		link_to("foto", t.foto)
		end
		end
		if t.responsavel_pela_embarcacao?
			div do
				"Resp. pela Embarc.: " + t.responsavel_pela_embarcacao
			end
		end
	end


actions
end


##attr_acessor :tipo_de_embarcacao, :embarcacao, :tipo, :n_de_serie, :fabricacao, :fabricante, :localizacao, :modelo, :classe, :cordas_retinida, :fita_refletiva, :bujao, :corda_salva_vidas

form :html => { :enctype => "multipart/form-data" } do |f|
  f.semantic_errors *f.object.errors.keys
  f.inputs "Editar" do
      f.input :tipo_de_embarcacao, :as => :radio, :collection => %w(BT RM)
      f.input :embarcacao, :label => 'Empurrador', :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }
      f.input :tipo, :label => 'Equipamento', :as => :select, :collection => ['Boia', 'Aparelho Flutuante']
      f.input :n_de_serie, :as => :number
      f.input :fabricacao, :as => :date_picker
      f.input :fabricante, :as => :text, :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }
      f.input :localizacao, :as => :select, :collection => ['Proa', 'Popa']
      f.input :modelo, :as => :radio, :collection => ['BCT60','RIOMAR','CIBORG','N/A']
      f.input :classe, :as => :select, :collection => ['I','II','III']
      f.input :cordas_retinida, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :fita_refletiva, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :bujao, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :corda_salva_vidas, :label => 'Tirantes Trancados', :as => :select, :collection => ['OK','N/C','N/A']
      f.input :validade, :as => :date_picker
      f.input :tecnico, :as => :select, :collection => User.all.order("name ASC").map { |e| e.name }
      f.input :responsavel_pela_embarcacao, :as => :text, :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }
      f.input :observacao, :as => :text, :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }
      f.input :foto, :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }



#        f.input :siget, :hint => "Preencha com o
  end

  f.action :submit, :button_html => { :label => "Salvar Registro", :class => "btn primary", :disable_with => 'Aguarde, atualizando informativo...' }
end




end
