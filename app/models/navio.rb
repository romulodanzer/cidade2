class Navio < ActiveRecord::Base

  


    #has_many :mensagens, :foreign_key => :navio_id
    has_many :mensagens, class_name: 'Mensagem', primary_key: 'codigo_rastreador', foreign_key: 'navio_id'
    has_many :posicoes, class_name: 'Posicao', primary_key: 'codigo_rastreador', foreign_key: 'navio_id'
    #has_many :compra_navios, :dependent => :destroy
    has_one :webcarga, class_name: 'Webcarga', primary_key: 'id', foreign_key: 'IdGestoSat'
    validates_uniqueness_of :name, :id, :codigo_rastreador
    validates_presence_of :linha, :name, :status
    validates_presence_of :filial, :if => :manobra?
    belongs_to :linha
    belongs_to :filial
    belongs_to :tipo_rastreador
    has_many :controle_de_extintors
    has_many :produtos
    has_many :titulo_de_inscricoes
    has_many :seguro_dpens
    has_many :certificado_de_arquiacoes
    has_many :certificado_de_borda_livres
    has_many :licenca_de_estacoes
    has_many :cartao_de_tripulacoes
    has_many :ctes
    has_many :dpps
    has_many :avarias
    has_many :ordem_de_servicos
    has_many :relatorio_manutencoes
    has_many :abastecimentos
    has_many :relatorio_manutencao_diesels
    has_many :relatorio_quebras
    has_many :carregamentos
    has_many :controle_ranchos
    has_many :previsoes
    has_many :ocorrencias
    has_many :solicitacoes
    has_many :viagens
    has_many :balsas

 
    has_attached_file :avatar
    validates_attachment_content_type :avatar, content_type: %w(image/jpeg image/gif image/png application/pdf)
    has_attached_file :casc_e_est_renovacao_de_classe_anexo
  
    validates_attachment_content_type :casc_e_est_renovacao_de_classe_anexo, content_type: %w(image/jpeg image/gif image/png application/pdf)
  
    has_attached_file :casc_e_est_manutencao_de_classe_mc1_anexo
  
    validates_attachment_content_type :casc_e_est_manutencao_de_classe_mc1_anexo, content_type: %w(image/jpeg image/gif image/png application/pdf)
  
  has_attached_file :casc_e_est_manutencao_de_classe_mc2_anexo
  validates_attachment_content_type :casc_e_est_manutencao_de_classe_mc2_anexo, content_type: %w(image/jpeg image/gif image/png application/pdf)
  
    validates_attachment_content_type :casc_e_est_manutencao_de_classe_mc2_anexo, content_type: %w(image/jpeg image/gif image/png application/pdf)
  
  has_attached_file :casc_e_est_manutencao_de_classe_mc3_anexo
  
    validates_attachment_content_type :casc_e_est_manutencao_de_classe_mc3_anexo, content_type: %w(image/jpeg image/gif image/png application/pdf)
  
  
     #acts_as_gmappable :process_geocoding => false
  
     def integrado?
       !webcarga.nil?
     end
  
     def nenhuma_aberta?
       viagens.where("fim_viagem is null").blank?
     end
  
  
      def manobra?
          linha_id == 4 or linha_id == 5 # Value of the hidden field as set in the form
      end
  
  
  end
  