class Tecnico < ActiveRecord::Base
  
  has_many :controle_de_extintors
  validates_presence_of :name
end
