class ControleDeExtintor < ActiveRecord::Base
    # :capacidade, :descarregado, :difusor, :embarcacao, :gatilho, :lacre, :mangueira,:fabricante, :manometro, :numero_do_registro, :observacao, :piso, :placa, :proxima_recarga, :setor, :tipo, :trava, :tecnico, :numero_interno, :foto, :tipo_de_embarcacao, :created_at
  
    validates_presence_of :embarcacao, :tipo_de_embarcacao, :numero_do_registro, :numero_interno, :setor, :capacidade,
    :mangueira, :difusor, :manometro, :gatilho, :lacre, :trava, :piso, :placa, :proxima_recarga, :fabricante, :tecnico
   
    def self.import(file)
      spreadsheet = open_spreadsheet(file)
      header = spreadsheet.row(2)
      (3..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      extintor = ControleDeExtintor.find_by(numero_do_registro: row["Selo do In Metro"], created_at: row["Data da inspeção"]) || ControleDeExtintor.new
      #extintor.attributes = row.to_hash.slice(*extintor.accessible_attributes)
      extintor.embarcacao = row["Embarcação"]
      extintor.tipo_de_embarcacao = "BM"
      extintor.numero_do_registro = row["Selo do In Metro"]
      extintor.numero_interno = row["Nº do Extintor "] 
      extintor.setor = row["Localização"]
      extintor.capacidade = row["capacidade extintora KGs"]
      extintor.mangueira = "OK"
      extintor.difusor = "OK"
      extintor.manometro = "OK"
      extintor.gatilho = "OK"
      extintor.lacre = "OK"
      extintor.trava = "OK"
      extintor.placa = "OK"
      extintor.proxima_recarga = row["Próxima Manutenção                   ( recarga )"]
      extintor.fabricante = row["Fabricante"]
      extintor.tecnico = "Importado via excel"
      extintor.save!
      end
   end
  
  def self.open_spreadsheet(file)
      case File.extname(file.original_filename)
      when "*.xls" then Roo::Spreadsheet.open(file.path)
      when "*.xlsx" then Roo::Spreadsheet.open(file.path)
      else raise "Tipo de arquivo desconhecido: #{file.original_filename}"
      end
  end
  
  def accessible_attributes
      ['id']
  end
  
    scope :feito_hoje, -> {where("created_at > ?", Date.today.at_beginning_of_day) }
    scope :ultimos_7_dias, -> { where("created_at > ?", Date.today-7.days) }
    scope :este_mes, -> { where("created_at > ? and created_at < ?",Date.today.at_beginning_of_month, Date.today.at_end_of_month) }
    scope :vencidos, -> { where("proxima_recarga < ?", Date.today) }
    scope :vencimento_proximo, -> { where("proxima_recarga > ? and proxima_recarga < ?",Date.today, Date.today+30.days) }
  
  end
  