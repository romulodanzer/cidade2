ActiveAdmin.register Hidrante, :as => "Controle de Hidrantes"  do
menu :label => "Controle de Hidrantes", :parent => "Sesmt"

permit_params :chaves_storz, :conexao, :conservacao_e_limpeza, :esguichos, :fabricante, :localizacao, :observacao, :pintura, :responsavel_embarcacao, :sinalizacao_e_demarcacao, :tampoes, :tecnico, :valvula_e_vedacao, :estado_geral, :embarcacao, :foto


scope :feito_hoje
scope :ultimos_7_dias
scope :este_mes

filter :embarcacao
filter :fabricante
filter :responsavel_embarcacao
filter :tecnico
filter :created_at, :label => "Vistoriado em", as: :date_time_range

controller do
 def index
  super do |format|
   format.html
   format.pdf { render(pdf: "page-hidrantes.pdf",:orientation => 'Landscape') }
  end
 end

end

index download_links: [:pdf] do
  render "hidrantes"

column :embarcacao, :sortable => :embarcacao
column :localizacao
column :fabricante
column :responsavel_embarcacao
column "Itens",:created_at, :sortable => :created_at do |t|
        div do
        case t.sinalizacao_e_demarcacao.upcase
        when 'N/A'
          status_tag("Sinalização/Demarcação" + t.sinalizacao_e_demarcacao, class: 'warning')
        when 'N/C'
          status_tag("Sinalização/Demarcação" + t.sinalizacao_e_demarcacao, class: 'error')
        when 'OK'
         status_tag("Sinalização/Demarcação" + t.sinalizacao_e_demarcacao, class: 'ok')
        else
          ""
        end
		case t.estado_geral.upcase
        when 'N/A'
         status_tag("Estado Geral: " + t.estado_geral, class: 'warning')
        when 'N/C'
         status_tag("Estado Geral: " + t.estado_geral, class: 'error')
        when 'OK'
         status_tag("Estado Geral: " + t.estado_geral, class: 'ok')
        else
          ""
        end
        case t.pintura.upcase
        when 'N/A'
         status_tag("Pintura: " + t.pintura, class: 'warning')
        when 'N/C'
         status_tag("Pintura: " + t.pintura, class: 'error')
        when 'OK'
         status_tag("Pintura: " + t.pintura, class: 'ok')
        else
          ""
        end
        case t.valvula_e_vedacao.upcase
        when 'N/A'
          status_tag("Válvula e Vedação: " + t.valvula_e_vedacao, class: 'warning')
        when 'N/C'
          status_tag("Válvula e Vedação: " + t.valvula_e_vedacao, class: 'error')
        when 'OK'
          status_tag("Válvula e Vedação: " + t.valvula_e_vedacao, class: 'ok')
        else
          ""
        end

        end
        div do

		case t.conexao.upcase
        when 'N/A'
          status_tag("Conexão" + t.conexao, class: 'warning')
        when 'N/C'
          status_tag("Conexão" + t.conexao, class: 'error')
        when 'OK'
         status_tag("Conexão" + t.conexao, class: 'ok')
        else
          ""
        end
        case t.chaves_storz.upcase
        when 'N/A'
          status_tag("Chaves Storz" + t.chaves_storz, class: 'warning')
        when 'N/C'
          status_tag("Chaves Storz" + t.chaves_storz, class: 'error')
        when 'OK'
         status_tag("Chaves Storz" + t.chaves_storz, class: 'ok')
        else
          ""
        end
		case t.tampoes.upcase
        when 'N/A'
          status_tag("Tampões" + t.tampoes, class: 'warning')
        when 'N/C'
          status_tag("Tampões" + t.tampoes, class: 'error')
        when 'OK'
         status_tag("Tampões" + t.tampoes, class: 'ok')
        else
          ""
        end
       	case t.conservacao_e_limpeza.upcase
        when 'N/A'
          status_tag("Conservação/Limpeza" + t.conservacao_e_limpeza, class: 'warning')
        when 'N/C'
          status_tag("Conservação/Limpeza" + t.conservacao_e_limpeza, class: 'error')
        when 'OK'
         status_tag("Conservação/Limpeza" + t.conservacao_e_limpeza, class: 'ok')
        else
          ""
        end

        div do

        case t.esguichos.upcase
        when 'N/A'
          status_tag("Esguichos" + t.esguichos, class: 'warning')
        when 'N/C'
          status_tag("Esguichos" + t.esguichos, class: 'error')
        when 'OK'
         status_tag("Esguichos" + t.esguichos, class: 'ok')
        else
          ""
        end
        case t.observacao.upcase
        when 'N/A'
          status_tag("Obs" + t.observacao, class: 'warning')
        when 'N/C'
          status_tag("Obs" + t.observacao, class: 'error')
        when 'OK'
         status_tag("Obs" + t.observacao, class: 'ok')
        else
          ""
        end
        status_tag("Verificado: " + t.created_at.to_formatted_s(:short), class: 'ok')
        status_tag("Técnico: " + t.tecnico, class: 'ok')
        end
        end
end
column :foto do |t|
	link_to "Foto", t.foto if t.foto?
end
actions
end






#:chaves_storz, :conexao, :conservacao_e_limpeza, :esguichos, :fabricante, :localizacao, :observacao,
#:pintura, :responsavel_embarcacao, :sinalizacao_e_demarcacao,
#:tampoes, :tecnico, :valvula_e_vedacao, :estado_geral, :embarcacao, :foto

form :html => { :enctype => "multipart/form-data" } do |f|
  f.semantic_errors *f.object.errors.keys
  f.inputs "Editar" do
      #f.input :tipo_de_embarcacao, :as => :radio, :collection => %w(BT RM)

      # :esguichos, :estado_geral,:conservacao_e_limpeza,:tampoes,:conexao,:valvula_e_vedacao,:pintura,:sinalizacao_e_demarcacao,:localizacao,:embarcacao
      f.input :embarcacao, :label => 'Empurrador', :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }
      f.input :localizacao, :as => :select, :collection => ['Proa','Popa']
      f.input :sinalizacao_e_demarcacao, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :pintura, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :valvula_e_vedacao, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :conexao, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :tampoes, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :conservacao_e_limpeza, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :estado_geral, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :chaves_storz, :as => :number
      f.input :esguichos, :as => :select, :collection => ['OK','N/C','N/A']
      f.input :tecnico#, :as => :select, :collection => User.find.all.order("name ASC").map { |e| e.name }
      f.input :fabricante, :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }
      f.input :responsavel_embarcacao, :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }
      f.input :observacao, :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }
      f.input :foto, :input_html => { :class => 'autogrow', :rows => 1, :cols => 1, :maxlength => 50  }
  end

  f.action :submit, :button_html => { :label => "Salvar Registro", :class => "btn primary", :disable_with => 'Aguarde, atualizando informativo...' }
end











end
