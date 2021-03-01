class User < ActiveRecord::Base
  #has_and_belongs_to_many :roles, :join_table => :users_roles
  #has_and_belongs_to_many :filiais, :join_table => :users_filiais

  belongs_to :resource, :polymorphic => true
  has_and_belongs_to_many :filiais
  #has_many :ordem_de_servicos
  validates_presence_of :filial_ids, :abastecimento_lvl, :attach_lvl, :anexo_lvl, :avaria_lvl, :balsa_lvl, :cliente_lvl, :controle_material_lvl, :controle_de_extintor_lvl, :embarque_lvl, :filial_lvl, :linha_lvl, :mensagem_lvl, :navio_lvl, :ordem_de_servico_lvl, :relatorio_quebra_lvl, :viagem_lvl, :user_lvl, :carregamento_lvl, :desembarque_lvl, :solicitante_lvl, :despesa_lvl, :centro_de_custo_lvl, :fornecedor_lvl, :despacho_lvl, :abastecimento_corporativo_lvl, :movimento_combustivel_lvl


  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  #attr_accessor :role_ids, :as => :admin
  #attr_accessor :name, :email, :password, :password_confirmation, :remember_me , :audio_mensagem, :audio_parada, :filial_ids, :superusuario, :abastecimento_lvl, :attach_lvl, :anexo_lvl, :avaria_lvl, :balsa_lvl, :cliente_lvl, :controle_material_lvl, :controle_de_extintor_lvl, :embarque_lvl, :filial_lvl, :linha_lvl, :mensagem_lvl, :navio_lvl, :ordem_de_servico_lvl, :relatorio_quebra_lvl, :viagem_lvl, :user_lvl, :carregamento_lvl, :desembarque_lvl, :solicitante_lvl, :despesa_lvl, :centro_de_custo_lvl, :fornecedor_lvl, :despacho_lvl, :abastecimento_corporativo_lvl, :movimento_combustivel_lvl


end
