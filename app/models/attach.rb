class Attach < ActiveRecord::Base
  # #attr_acessor :title, :body

  belongs_to :avaria 
  belongs_to :despacho
  belongs_to :ordem_de_servico
  #attr_acessor :avatar, :attaches_attributes, :descricao, :avatar_updated_at
  #validates_presence_of :avaria 

  accepts_nested_attributes_for :avaria, :despacho
#  mount_uploader :foto AvariasUploader 
  has_attached_file :avatar, 
  :styles => { :small => "100x100", :medium => "213x160" }
 
  validates_attachment_content_type :avatar, content_type: %w(image/jpeg image/png image/bmp)
  
 
end
