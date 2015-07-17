class GameList
	
	attr_accessor :game_list
	
	def initialize(array)
		@game_list=array
	end
	
	def remove(remove_list)
		remove_list.each do |del|
			@game_list.delete(del)
		end
 		return @game_list
	end
	
# 	def game_list
# 		@game_list
# 	end
end