ActiveAdmin.register ControleDeExtintor, :as => "Controle de Extintores" do
menu :label => "Controle de Extintores", :parent => "Sesmt"

permit_params :capacidade, :descarregado, :difusor, :embarcacao, :gatilho, :lacre, :mangueira,:fabricante, :manometro, :numero_do_registro, :observacao, :piso, :placa, :proxima_recarga, :setor, :tipo, :trava, :tecnico, :numero_interno, :foto, :tipo_de_embarcacao, :created_at

scope :feito_hoje
scope :ultimos_7_dias
scope :este_mes
scope :vencidos
scope :vencimento_proximo

filter :embarcacao
filter :numero_do_registro, :label => "Reg."
filter :numero_interno
filter :tecnico
filter :tipo_de_embarcacao
filter :tipo
filter :proxima_recarga, :label => "Próx. Recarga"
filter :created_at, :label => "Vistoriado em"


controller do
 def index
  super do |format|
   format.html
   format.pdf { render(pdf: "page-extintores.pdf",:orientation => 'Landscape') }
  end
 end

def create
	create!{ collection_path }
end

end


index download_links: [:pdf] do
  render "extintores"


column :embarcacao do |t|
	if t.tipo_de_embarcacao?
		t.tipo_de_embarcacao + " " + t.embarcacao
	else
		t.embarcacao
	end
end
column "n.", :numero_interno
column "Reg.",:numero_do_registro
column :tipo
#column :embarcacao
#column :tipo_de_embarcacao
column "local",:setor
column :fabricante
#column "Descarregado",:descarregado, :sortable => :descarregado do |t|
#	case t.descarregado
#	when 'Sim'
#	  status_tag(t.descarregado, class: 'error')
#	when 'Não'
#	  status_tag(t.descarregado, class: 'ok')
#	when 'N/A'
#	  status_tag(t.descarregado, :warming)
#	else
#	  ''
#	end
#end
column "Próx. Recarga",:proxima_recarga, :sortable => :proxima_recarga do |v|
      if v.proxima_recarga <= Date.today
        div :class => "fvermelho" do status_tag(v.proxima_recarga.strftime('%d/%m/%Y'), class: 'error') end
      else
      if v.proxima_recarga < Date.today+1.month
          div :class => "famarelo" do status_tag(v.proxima_recarga.strftime('%d/%m/%Y'), class: 'warning') end
      else
        div :class => "fverde" do status_tag(v.proxima_recarga.strftime('%d/%m/%Y'), class: 'ok') end
      end
	    end
  end
column "Cap.", :capacidade
column "Itens",:difusor, :sortable => :difusor do |t|
	div do
	case t.difusor
	when 'N/A'
	  status_tag("Difusor" + t.difusor, class: 'warning')
	when 'N/C'
	  status_tag("Difusor" + t.difusor, class: 'error')
  when 'OK'
	 status_tag("Difusor" + t.difusor, class: 'ok')
  when 'OK'
   status_tag("Difusor" + t.difusor, class: 'ok')
	else
	  ''
	end

	case t.gatilho
	when 'N/A'
	 status_tag("Gatilho" + t.gatilho, class: 'warning')
	when 'N/C'
	  status_tag("Gatilho" + t.gatilho, class: 'error')
	when 'OK'
	  status_tag("Gatilho" + t.gatilho, class: 'ok')
  when 'OK'
   status_tag("Gatilho" + t.difusor, class: 'ok')
	else

	end

	case t.lacre
	when 'N/A'
	  status_tag("Lacre" + t.lacre, class: 'warning')
	when 'N/C'
	  status_tag("Lacre" + t.lacre, class: 'error')
	when 'OK'
	  status_tag("Lacre" + t.lacre, class: 'ok')
  when 'OK'
   status_tag("Lacre" + t.difusor, class: 'ok')
	else
	  ''
	end

	end

	div do
	case t.mangueira
	when 'N/A'
	  status_tag("Mangote" + t.mangueira, class: 'warning')
	when 'N/C'
	  status_tag("Mangote" + t.mangueira, class: 'error')
	when 'OK'
	  status_tag("Mangote" + t.mangueira, class: 'ok')
  when 'OK'
   status_tag("Mangote" + t.difusor, class: 'ok')
	else
	  ''
	end

	case t.manometro
	when 'N/A'
	  status_tag("Manometro" + t.manometro, class: 'warning')
	when 'N/C'
	  status_tag("Manometro" + t.manometro, class: 'error')
	when 'OK'
	  status_tag("Manometro" + t.manometro, class: 'ok')
  when 'OK'
   status_tag("Manometro" + t.difusor, class: 'ok')
	else
	  ''
	end

	case t.piso
	when 'N/A'
	  status_tag("Piso" + t.piso, class: 'warning')
	when 'N/C'
	  status_tag("Piso" + t.piso, class: 'error')
	when 'OK'
	  status_tag("Piso" + t.piso, class: 'ok')
  when 'OK'
   status_tag("Piso" + t.difusor, class: 'ok')
	else
	  ''
	end

	end

	div do

	case t.placa
	when 'N/A'
	  status_tag("Placa" + t.placa, class: 'warning')
	when 'N/C'
	  status_tag("Placa" + t.placa, class: 'error')
	when 'OK'
	  status_tag("Placa" + t.placa, class: 'ok')
  when 'OK'
   status_tag("Placa" + t.difusor, class: 'ok')
	else
	  ''
	end

	case t.trava
	when 'N/A'
	  status_tag("trava" + t.trava, class: 'warning')
	when 'N/C'
	  status_tag("trava" + t.trava, class: 'error')
	when 'OK'
	  status_tag("trava" + t.trava, class: 'ok')
  when 'OK'
   status_tag("trava" + t.difusor, class: 'ok')
	else
	  ''
	end
	end
end
column "Detalhes" do |t|
	div do "Técnico: " + t.tecnico if t.tecnico end
	div do "Obs: " + t.observacao if !t.observacao.blank? end
	div do "feito: " + t.created_at.to_formatted_s(:short)  end
end
column "foto" do |t|
  link_to("foto", t.foto) if t.foto?
end
actions
end

##attr_acessor :capacidade, :descarregado, :difusor, :embarcacao, :gatilho, :lacre, :mangueira,
#:manometro, :numero_do_registro,
#:observacao, :piso, :placa, :proxima_recarga, :setor, :tipo, :trava, :tecnico,
 #:numero_interno, :foto

form :html => { :enctype => "multipart/form-data" } do |f|
  f.semantic_errors *f.object.errors.keys
  f.inputs "Editar" do
      f.input :tipo_de_embarcacao, :as => :radio, :collection => %w(BT RM)
      f.input :embarcacao, :label => 'Empurrador', :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }
      f.input :numero_do_registro, :as => :number, :label => 'Inmetro'
      f.input :numero_interno, :as => :number, :label => 'N. Extintor'
      f.input :setor, :as => :text, :label => 'Local', :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }
      f.input :capacidade, :as => :select, :collection => ['02', '04', '06', '12']
      f.input :capacidade, :as => :radio, :collection => ['CO²', 'Pó Químico']
      f.input :mangueira,:label => 'Mangote', :as => :select, :collection => ['OK','N/C','N/A']
      f.input :difusor, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :manometro, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :gatilho, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :lacre, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :trava, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :piso, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :placa, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :tecnico#, :as => :select, :collection => User.find.all.order("name ASC").map { |e| e.name }
      f.input :proxima_recarga, :as => :date_picker
      f.input :fabricante, :as => :text, :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }
      f.input :observacao, :as => :text, :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }
#        f.input :siget, :hint => "Preencha com o
  end

  f.action :submit, :button_html => { :label => "Salvar Registro", :class => "btn primary", :disable_with => 'Aguarde, atualizando informativo...' }
end



end
