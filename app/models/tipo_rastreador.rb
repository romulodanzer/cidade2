class TipoRastreador < ActiveRecord::Base
  #attr_accessible :name
  has_many :navios
end
