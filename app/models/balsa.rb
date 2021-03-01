class Balsa < ActiveRecord::Base
	#has_and_belongs_to_many :viagens
	has_many :carregamentos
	has_many :avarias
	has_many :ordem_de_servicos
	has_many :dpps
	has_many :prpns
	has_many :titulo_de_inscricoes
	has_many :certificado_de_arquiacoes
	has_many :certificado_de_borda_livres
	has_many :seguro_dpens
	validates_presence_of :name 
	validates_uniqueness_of :name
      accepts_nested_attributes_for :carregamentos, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
	
      #attr_acessor :name, :carregamento_ids, :imo, :tonelagem_bruta, :comprimento, :largura, :calado, :arquiacao, :capacidade, :balsaid,:casc_e_est_validade_total,:casc_e_est_classificacao_inicial,:casc_e_est_manutencao_de_classe_mc1_abertura,:casc_e_est_manutencao_de_classe_mc1_fechamento,:casc_e_est_manutencao_de_classe_mc1_realizado,:casc_e_est_manutencao_de_classe_mc1_anexo,:casc_e_est_manutencao_de_classe_mc2_abertura,:casc_e_est_manutencao_de_classe_mc2_fechamento,:casc_e_est_manutencao_de_classe_mc2_realizado,:casc_e_est_manutencao_de_classe_mc2_anexo,:casc_e_est_manutencao_de_classe_mc3_abertura,:casc_e_est_manutencao_de_classe_mc3_fechamento,:casc_e_est_manutencao_de_classe_mc3_realizado,:casc_e_est_manutencao_de_classe_mc3_anexo,:casc_e_est_renovacao_de_classe_abertura,:casc_e_est_renovacao_de_classe_fechamento,:casc_e_est_renovacao_de_classe_realizado,:casc_e_est_renovacao_de_classe_anexo 

  has_attached_file :casc_e_est_renovacao_de_classe_anexo
  validates_attachment_content_type :casc_e_est_renovacao_de_classe_anexo, content_type: %w(image/jpeg image/gif image/png application/pdf)

  has_attached_file :casc_e_est_manutencao_de_classe_mc1_anexo
  validates_attachment_content_type :casc_e_est_manutencao_de_classe_mc1_anexo, content_type: %w(image/jpeg image/gif image/png application/pdf)

  has_attached_file :casc_e_est_manutencao_de_classe_mc2_anexo
  validates_attachment_content_type :casc_e_est_manutencao_de_classe_mc2_anexo, content_type: %w(image/jpeg image/gif image/png application/pdf)

  has_attached_file :casc_e_est_manutencao_de_classe_mc3_anexo
  validates_attachment_content_type :casc_e_est_manutencao_de_classe_mc3_anexo, content_type: %w(image/jpeg image/gif image/png application/pdf)


end
