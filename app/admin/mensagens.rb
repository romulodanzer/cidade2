ActiveAdmin.register Mensagem do

  permit_params :navio_id, :accountnumber, :binarydatatype, :done, :externalsensoralarm, :grmn, :landmark, :latitude, :longitude, :macronumber, :macroversion, :messagetime, :msgpriority, :msgsubtype, :msgtag, :positiontime, :replygfmn, :rpm, :temperaturei, :temperatureii, :text, :vehicleignition, :velocity

    batch_action "Ler", :confirm => "Este processo ira marcar todas como lida, tem certeza?" do |selection|
      if can? :update, Viagem
      Mensagem.find(selection).each { |p| p.done=true;p.save() }
      end
      redirect_to collection_path, :notice => "Mensagens marcadas como lidas!"
    end

    batch_action :destroy, false
    actions :all, :except => [:destroy, :edit, :new]

    scope :nao_lidas
    #scope :posicoes_radio
    scope :status_porto
    #scope :fim_de_viagens
    batch_action :destroy, false



  filter :navio, :as => :select, :collection => Navio.order("name ASC")
  filter :messagetime, :label => 'Data da Mensagem'
  filter :text, :label => 'Texto na Mensagem'


  index do
    selectable_column
    column :navio do |t|
        t.navio.name if !t.navio.blank?
    end
    column "Hora da Mensagem",:messagetime, :sortable => :messagetime do |mensagem|
      mensagem.messagetime.strftime('%d/%m/%Y %H:%M')
    end
    column "Local", :landmark
    column "Mensagem", :text do |mensagem|
    if mensagem.macronumber == 2 and mensagem.macroversion == 2
      div do
        "Comandante: " + mensagem.text[1..11]
      end
      div do
        "Oper.: " + mensagem.text[12..32]
      end
      div do
        "Local: " + mensagem.text[33..52]
      end
    else
        mensagem.text
    end
    end
    column "Status",:done do |mensagem|
      if mensagem.done
        status_tag("Lida", :ok)
      else
        status_tag("Nao Lida", :error)
      end
    end
    actions
  end


controller do

  def scoped_collection
      super.todas
  end

  def show
      super do |format|
        format.pdf { render(pdf: "page-#{resource.id}.pdf") }
      end
    end

end


  form do |f|
    f.inputs "Editar Mensagem" do
      f.input :done, :label => "Marcar como Lida"
      f.input :navio, :label => "Empurrador", :input_html => { :disabled => true }
      f.input :messagetime, :label => "Hora da Mensagem", :input_html => { :disabled => true }
      f.input :landmark, :label => "Local", :input_html => { :disabled => true }
      f.input :text,:label => "Texto", :input_html => { :disabled => true }
    end
    f.actions
  end




  show do

    render 'mapa'
    attributes_table do
      row :navio do |t|
        t.navio.name if !t.navio.blank?
      end
      row :Local do |mensagem|
        mensagem.landmark if mensagem.landmark
      end
      row :texto do |mensagem|
       simple_format mensagem.text if mensagem.text
      end
      row "Hora da Posicao" do |mensagem|
        mensagem.positiontime.strftime('%d/%m/%Y %H:%M') if mensagem.positiontime
      end
      row "Hora da Mensagem" do |mensagem|
        mensagem.messagetime.strftime('%d/%m/%Y %H:%M') if mensagem.messagetime
      end
    end
  end

end
