class Boia < ActiveRecord::Base
  #attr_acessor :bujao, :classe, :corda_salva_vidas, :cordas_retinida, :embarcacao, :fabricacao, :fabricante, :fita_refletiva, :modelo, :n_de_serie, :tecnico, :tipo, :identificacao_rebocador, :observacao, :foto, :tipo_de_embarcacao, :validade, :localizacao, :responsavel_pela_embarcacao

  validates_presence_of :tipo_de_embarcacao, :embarcacao, :tipo, :n_de_serie, :fabricacao, :fabricante, :modelo, :classe, :cordas_retinida, :fita_refletiva, :bujao, :corda_salva_vidas, :tecnico

  scope :feito_hoje, -> { where("created_at > ?", Date.today.at_beginning_of_day) }
  scope :ultimos_7_dias, -> { where("created_at > ?", Date.today-7.days) }
  scope :este_mes, -> { where("created_at > ? and created_at < ?",Date.today.at_beginning_of_month, Date.today.at_end_of_month) }
  scope :boia_atu, -> { where("created_at > ? and created_at < ?",Date.today.at_beginning_of_month, Date.today.at_end_of_month) }
  scope :boia_ante, -> { where("created_at > ? and created_at < ?",(Date.today-1.month).at_beginning_of_month, (Date.today-1.month).at_end_of_month) }
  
  def self.import(file)
    @erros = 0
    @total = 0
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      #boia.attributes = row.to_hash.slice(*extintor.accessible_attributes)
      if !row["Data da inspecao"].blank? && !row["Embacarcao"].blank? && !row["Modelo: BCT60,RIOMAR,CIBORG;APMZ 12"].blank? && !row["TIPO"].blank? && !row["Data de Fabricacao"].blank? && !row["N de serie"].blank? && !row["Classe"].blank? && !row["Fabricante"].blank? == true
        if row["Bujao"].blank?
          @bujao = "N/C"
          else
          @bujao = row["Bujao"]
        end
        
        if row["Corda Retinida"].blank?
          @retinida = "N/C"
          else
          @retinida = row["Corda Retinida"]
        end        
        if row["Tirante trancado"].blank?
          @tirante = "N/C"
          else
          @tirante = row["Tirante trancado"]
        end        
        if row["Fita refletiva"].blank?
          @refletiva = "N/C"
          else
          @refletiva = row["Fita refletiva"]
        end

        boia = Boia.find_or_create_by!(embarcacao: row["Embacarcao"],
            tipo_de_embarcacao: "BT",
            tipo: row["TIPO"],
            n_de_serie: row["N de serie"],
            fabricacao: row["Data de Fabricacao"],
            fabricante: row["Fabricante"],
            modelo: row["Modelo: BCT60,RIOMAR,CIBORG;APMZ 12"],
            classe: row["Classe"],
            cordas_retinida: @retinida,
            fita_refletiva: @refletiva,
            bujao: @bujao,
            corda_salva_vidas: @tirante,
            tecnico: "Importado via excel",
            created_at: row["Data da inspecao"])
            @total += 1
      else
        @erros += 1
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

end
