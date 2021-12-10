module NewsHelper
	def countComments count
		if count >= 2
			"#{count} Comentários"
		elsif count == 1
			"#{count} comentário"
		else
			"Nenhum comentário"
		end
	end		
end
