class Viagem < ActiveRecord::Base
#has_paper_trail
## validacoes @@
validates_presence_of :inicio_viagem, :navio, :trecho#, :siget #, :carregamentos
#validates :siget, uniqueness: true
#validates :inicio_viagem, date: { after: Proc.new { Time.zone.now-2.days }, before: Proc.new { Time.zone.now + 1.hour } }, :on => :create
#validates :fim_viagem, date: { after: Proc.new { Time.zone.now-2.days }, before: Proc.new { Time.zone.now + 1.hour }, allow_blank: true }
validates :fim_viagem, date: { after: :inicio_viagem, allow_blank: true }
#### escopo
#default_scope lambda { where :navio_id => Navio.all.map { |e| e.id } }
#default_scope lambda { where :navio_id != '9999999' }
scope :abertas, -> { where(:fim_viagem => nil) }
#paperclip

#acts_as_gmappable :process_geocoding => false
#associacoes
belongs_to :navio#, class_name: 'Navio', primary_key: 'codigo_rastreador', foreign_key: 'navio_id'
  #has_and_belongs_to_many :balsas
belongs_to :trecho

#after_save :lanca_desembarque
before_save :lanca_previsao

def lanca_previsao
    if previsao == nil
          self.previsao = inicio_viagem+trecho.tempo_padrao.hours
      else
    end
end

def concluida(viagem)
  where("fim_viagem(viagem) <> nil")
end

def aberta?
  self.fim_viagem == nil || self.inicio_viagem != nil
end

# anexo do mapa de conves
  has_attached_file :inventario

  validates_attachment_content_type :inventario, content_type: %w(image/jpeg image/gif image/png application/pdf)
# fim de anexo de mapa de conves

def meta(viagem)
  viagem.trecho.meta
end


end
