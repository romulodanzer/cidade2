class Hidrante < ActiveRecord::Base
  #attr_acessor :chaves_storz, :conexao, :conservacao_e_limpeza, :esguichos, :fabricante, :localizacao, :observacao, :pintura, :responsavel_embarcacao, :sinalizacao_e_demarcacao, :tampoes, :tecnico, :valvula_e_vedacao, :estado_geral, :embarcacao, :foto

  validates_presence_of :esguichos,:estado_geral,:conservacao_e_limpeza,:tampoes,:conexao,:valvula_e_vedacao,:pintura,:sinalizacao_e_demarcacao,:localizacao,:embarcacao, :tecnico

  scope :feito_hoje, -> { where("created_at > ?", Date.today.at_beginning_of_day) }
  scope :ultimos_7_dias, -> { where("created_at > ?", Date.today-7.days) }
  scope :este_mes, -> { where("created_at > ? and created_at < ?",Date.today.at_beginning_of_month, Date.today.at_end_of_month) }
  scope :hidrantes_atu, -> { where("created_at > ? and created_at < ?",Date.today.at_beginning_of_month, Date.today.at_end_of_month) }
  scope :hidrantes_ante, -> { where("created_at > ? and created_at < ?",(Date.today-1.month).at_beginning_of_month, (Date.today-1.month).at_end_of_month) }

end
