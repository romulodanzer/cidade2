class Anexo < ActiveRecord::Base
  #attr_acessor :name
  has_attached_file :arquivo
  validates_presence_of :arquivo
end
