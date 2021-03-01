class Linha < ActiveRecord::Base
  #attr_accessible :name
  has_many :navios
  has_many :linhas
end
