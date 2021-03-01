class Mensagem < ActiveRecord::Base
  self.table_name = "AMENSAGENS"

  #belongs_to :navio, foreign_key: "codigo_rastreador"
  #belongs_to :navio
  belongs_to :navio, class_name: 'Navio', primary_key: 'codigo_rastreador', foreign_key: 'navio_id'

  has_many :solicitacoes
  validates_presence_of :navio
  default_scope lambda { where :msgsubtype => ['1001', '1005'] }

  #scope :todas, where(:msgsubtype => '1001')

  scope :todas, -> { where(:msgsubtype => '1001') }
  scope :nao_lidas, -> {where(:msgsubtype => '1001', :macronumber => '0', :done => false)}
  scope :status_porto, -> { where(:done => false, :macronumber => [2]) }
  #scope :fim_de_viagens, where(:done => false, :macronumber => [3])
  #scope :posicoes_radio, where(:done => false, :macronumber => [2])

  #acts_as_gmappable :process_geocoding => false

  def navio?
    Navio.all.map(&:id)
  end

  def self.with_scopehere(i)
    # code here
  end



end
