ActiveAdmin.register Mangueira, :as => "Controle de Mangueiras"  do
menu :label => "Controle de Mangueiras", :parent => "Sesmt"

permit_params :acondicionada_e_aduchada, :acoplamentos, :anel_de_vedacao, :comprimento, :diametro, :embarcacao, :estado_de_conservacao, :fabricacao, :fabricante, :localizacao, :responsavel_pela_embarcacao, :teste_hidrostatico, :tipo, :tecnico, :observacao, :foto

scope :feito_hoje
scope :ultima_semana
scope :este_mes


filter :embarcacao
filter :fabricante
filter :localizacao
filter :teste_hidrostatico, as: :date_time_range
filter :tipo
filter :tecnico
filter :proxima_recarga#, :label => "Próx. Recarga", as: :date_time_range
filter :created_at, :label => "Vistoriado em", as: :date_time_range

controller do
 def index
  super do |format|
   format.html
   format.pdf { render(pdf: "page-mangueiras.pdf",:orientation => 'Landscape') }
  end
 end

end



##
index download_links: [:pdf] do
  render "mangueiras"

column :id
column :embarcacao
column "local",:localizacao
column :fabricante
column :fabricacao do |t|
  t.fabricacao.strftime('%d/%m/%Y')
end
column :teste_hidrostatico do |t|
	t.teste_hidrostatico.strftime('%d/%m/%Y') if !t.teste_hidrostatico.nil?
end
#column "Compr.",:comprimento
#column :diametro
column :tipo
column "Itens",:created_at, :sortable => :created_at do |t|
        div do
        case t.acoplamentos
        when 'N/A'
          status_tag("Acoplamentos" + t.acoplamentos, class: 'warning')
        when 'N/C'
          status_tag("Acoplamentos" + t.acoplamentos, class: 'error')
        when 'Ok'
         status_tag("Acoplamentos" + t.acoplamentos, class: 'ok')
        else
          ''
        end

        case t.anel_de_vedacao
        when 'N/A'
         status_tag("Anel Vedação: " + t.anel_de_vedacao, class: 'warning')
        when 'N/C'
         status_tag("Anel Vedação: " + t.anel_de_vedacao, class: 'error')
        when 'Ok'
         status_tag("Anel Vedação: " + t.anel_de_vedacao, class: 'ok')
        else
          ''
        end

        case t.acondicionada_e_aduchada
        when 'N/A'
          status_tag("Acondicionamento: " + t.acondicionada_e_aduchada, class: 'warning')
        when 'N/C'
          status_tag("Acondicionamento: " + t.acondicionada_e_aduchada, class: 'error')
        when 'Ok'
          status_tag("Acondicionamento: " + t.acondicionada_e_aduchada, class: 'ok')
        else
          ''
        end

	end

        div do
          status_tag("Responsavel: " + t.responsavel_pela_embarcacao, class: 'ok')
          status_tag("Técnico: " + t.tecnico, class: 'ok')
          status_tag("Verificado: " + t.created_at.to_formatted_s(:short), class: 'ok')
        end
end

	column :observacao do |t|
                if t.observacao?
			div do
				t.observacao
			end
		end
		if t.foto?
			div do
				link_to("foto", t.foto)
			end
                end
	end
actions
end


###attr_acessor :acondicionada_e_aduchada, :acoplamentos, :anel_de_vedacao, :comprimento, :diametro, :embarcacao, :estado_de_conservacao,
#:fabricacao, :fabricante, :localizacao, :responsavel_pela_embarcacao, :teste_hidrostatico, :tipo, :tecnico, :observacao, :foto

form :html => { :enctype => "multipart/form-data" } do |f|
  f.semantic_errors *f.object.errors.keys
  f.inputs "Editar" do
      #f.input :tipo_de_embarcacao, :as => :radio, :collection => %w(BT RM)
      f.input :embarcacao, :label => 'Empurrador', :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }
      f.input :localizacao, :as => :radio, :collection => ['Proa', 'Popa']
      f.input :fabricante, :as => :text, :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }
      f.input :fabricacao, :as => :date_picker
      f.input :teste_hidrostatico, :as => :date_picker
      f.input :comprimento, :as => :number
      f.input :diametro, :as => :select, :collection => ['1 1/2 pol','2 1/2pol']
      f.input :tipo, :as => :select, :collection => ['Tipo1','Tipo2','Tipo3']
      f.input :acoplamentos, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :anel_de_vedacao, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :acondicionada_e_aduchada, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :estado_de_conservacao, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :tecnico#, :as => :select, :collection => User.find.all.order("name ASC").map { |e| e.name }
      f.input :responsavel_pela_embarcacao, :as => :text, :label => 'Local', :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }
      f.input :observacao, :as => :text, :label => 'Local', :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }
      f.input :foto, :as => :text, :label => 'Local', :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }

#        f.input :siget, :hint => "Preencha com o
  end

  f.action :submit, :button_html => { :label => "Salvar Registro", :class => "btn primary", :disable_with => 'Aguarde, atualizando informativo...' }
end



end
