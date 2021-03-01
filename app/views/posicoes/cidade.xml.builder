xml.instruct! :xml, :version => "1.0", :encoding => "UTF-8"
xml.xml :version => "2.1" do
  xml.posicoes do
    for posicao in @sem_viagem
      xml.posicao do
        xml.id posicao.id
        xml.navio_id posicao.navio.id
        xml.navio_nome posicao.navio.name
        xml.codigo_rastreador posicao.navio.codigo_rastreador
        xml.longitude posicao.longitude
        xml.latitude posicao.latitude
        xml.descricao posicao.landmark
	xml.hora posicao.positiontime
      end
    end    
  end
  end
