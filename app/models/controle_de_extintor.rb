class ControleDeExtintor < ActiveRecord::Base
    # :capacidade, :descarregado, :difusor, :embarcacao, :gatilho, :lacre, :mangueira,:fabricante, :manometro, :numero_do_registro, :observacao, :piso, :placa, :proxima_recarga, :setor, :tipo, :trava, :tecnico, :numero_interno, :foto, :tipo_de_embarcacao, :created_at
  
    validates_presence_of :embarcacao, :tipo_de_embarcacao, :numero_do_registro, :numero_interno, :setor, :capacidade,
    :mangueira, :difusor, :manometro, :gatilho, :lacre, :trava, :piso, :placa, :proxima_recarga, :fabricante, :tecnico
   
    def self.import(file)
      @erros = []
      @total = 0
      spreadsheet = open_spreadsheet(file)
      header = spreadsheet.row(2)
      (3..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        #extintor.attributes = row.to_hash.slice(*extintor.accessible_attributes)
        if !row["Selo do In Metro"].blank? && !row["Selo do In Metro"].blank? && !row["Embacarcao"].blank? && !row["Embacarcao"].blank? && !row["Tipo"].blank? && !row["Selo do In Metro"].blank? && !row["N do Extintor"].blank? && !row["Localizacao"].blank? && !row["capacidade extintora KGs"].blank? && !row["Proxima Manutencao-recarga"].blank? && !row["Fabricante"].blank? && !row["Data da inspecao"].blank? == true
          if row["Piso"].blank?
            @piso = "OK"
            else
            @piso = row["Piso"]
          end
          
          if row["Placa"].blank?
            @placa = "OK"
            else
            @placa = row["Placa"]
          end

          extintor = ControleDeExtintor.find_or_create_by!(numero_do_registro: row["Selo do In Metro"],
                                                        embarcacao: row["Embacarcao"],
                                                        tipo_de_embarcacao: "BM",
                                                        tipo: row["Tipo"],
                                                        numero_interno: row["N do Extintor"],
                                                        setor: row["Localizacao"],
                                                        capacidade: row["capacidade extintora KGs"],
                                                        mangueira: "OK",
                                                        difusor: "OK",
                                                        manometro: "OK",
                                                        gatilho: "OK",
                                                        lacre: "OK",
                                                        piso: @piso,
                                                        placa: @placa,
                                                        trava: "OK",
                                                        proxima_recarga: row["Proxima Manutencao-recarga"],
                                                        fabricante: row["Fabricante"],
                                                        tecnico: "Importado via excel",
                                                        created_at: row["Data da inspecao"])
                                                        @total += 1
        else
          @erros << i
        end
      end
   end
  
  def self.open_spreadsheet(file)
      case File.extname(file.original_filename)
      when ".xls" then Roo::Spreadsheet.open(file.path)
      when ".xlsx" then Roo::Spreadsheet.open(file.path)
      else 
        raise "Tipo de arquivo desconhecido: #{file.original_filename}"
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
    scope :extintores_atu, -> { where("created_at > ? and created_at < ?",Date.today.at_beginning_of_month, Date.today.at_end_of_month) }
    scope :extintores_ante, -> { where("created_at > ? and created_at < ?",(Date.today-1.month).at_beginning_of_month, (Date.today-1.month).at_end_of_month) }
  
end
  