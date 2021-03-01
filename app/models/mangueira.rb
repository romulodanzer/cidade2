class Mangueira < ActiveRecord::Base
  #attr_acessor :acondicionada_e_aduchada, :acoplamentos, :anel_de_vedacao, :comprimento, :diametro, :embarcacao, :estado_de_conservacao, :fabricacao, :fabricante, :localizacao, :responsavel_pela_embarcacao, :teste_hidrostatico, :tipo, :tecnico, :observacao, :foto

  validates_presence_of :embarcacao, :localizacao, :fabricante, :fabricacao, :tecnico, :comprimento, :diametro, :tipo, :acoplamentos, :anel_de_vedacao, :acondicionada_e_aduchada, :estado_de_conservacao


  scope :feito_hoje, -> { where("created_at > ?", Date.today.at_beginning_of_day) }
  scope :ultima_semana, -> { where("created_at > ?", Date.today-7.days) }
  scope :este_mes, -> { where("created_at > ? and created_at < ?",Date.today.at_beginning_of_month, Date.today.at_end_of_month) }


end
