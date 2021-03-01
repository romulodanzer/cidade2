#encoding: UTF-8
xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Gestosat Mensagens"
    xml.description "Software-Development, Mobiles Devices"
    xml.language "pt-br"
  
    for mensagem in @mensagens
      xml.item do
        xml.title mensagem.navio.name  
        xml.author mensagem.navio.name
        xml.pubDate mensagem.positiontime.to_s(:rfc822)
        #xml.link "http://ceasa.portochibatao.com.br/admin/mensagens/" + mensagem.id.to_s
        xml.guid "http://ceasa.portochibatao.com.br/admin/mensagens/" + mensagem.id.to_s
        xml.description mensagem.text
		# if you like, do something with your content text here e.g. insert image tags.
		# Optional. I'm doing this on my website.
        #xml.description "<p>" + mensagem.text + "</p>"
      end
    end
  end
end



 