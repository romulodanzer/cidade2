def calcula_distancias

  	for navio in Navio.all 
		if navio.posicoes.count > 10		
			@posicoes = Posicao.where("navio_id = ? and processada is null", navio.id).order(positiontime: :asc)
			@x = 0 
			@y = 1
			@z = @posicoes.count
			@distancia = 0
				while @x < @z
					if @posicoes[@y] and @posicoes[@x] != nil
						@distancia = Geocoder::Calculations.distance_between([@posicoes[@y].latitude, @posicoes[@y].longitude],[@posicoes[@x].latitude, @posicoes[@x].longitude])
						@posicoes[@y].processada = true
						@posicoes[@y].distancia = @distancia
						@posicoes[@y].save
					@x += 1
					@y += 1
					else
					@x += 1
					@y += 1
					end
				end
		end
	end 
end