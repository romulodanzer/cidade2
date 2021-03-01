class Filial < ActiveRecord::Base
  #attr_accessible :fone, :name, :user_ids, :meta_de_carregamento, :meta_de_desembarque, :capacidade_do_patio, :prefixo_trecho, :preco_diesel, :preco_hfo, :preco_botija_de_gas, :preco_gasolina, :preco_lubrificante
  validates_presence_of :name, :meta_de_carregamento, :meta_de_desembarque, :capacidade_do_patio, :prefixo_trecho, :preco_diesel, :preco_hfo, :preco_botija_de_gas, :preco_gasolina, :preco_lubrificante

  has_and_belongs_to_many :users
  has_many :carregamentos
  has_many :navios
  has_many :ordem_de_servicos
  has_many :avarias
  has_many :trechos 
  has_many :unloadings
  #has_and_belongs_to_many :users, :join_table => :users_filiais
  has_many :abastecimentos
end


    