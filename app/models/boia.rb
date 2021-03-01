class Boia < ActiveRecord::Base
  #attr_acessor :bujao, :classe, :corda_salva_vidas, :cordas_retinida, :embarcacao, :fabricacao, :fabricante, :fita_refletiva, :modelo, :n_de_serie, :tecnico, :tipo, :identificacao_rebocador, :observacao, :foto, :tipo_de_embarcacao, :validade, :localizacao, :responsavel_pela_embarcacao

  validates_presence_of :tipo_de_embarcacao, :embarcacao, :tipo, :n_de_serie, :fabricacao, :fabricante, :localizacao, :modelo, :classe, :cordas_retinida, :fita_refletiva, :bujao, :corda_salva_vidas, :tecnico

  scope :feito_hoje, -> { where("created_at > ?", Date.today.at_beginning_of_day) }
  scope :ultimos_7_dias, -> { where("created_at > ?", Date.today-7.days) }
  scope :este_mes, -> { where("created_at > ? and created_at < ?",Date.today.at_beginning_of_month, Date.today.at_end_of_month) }

end
