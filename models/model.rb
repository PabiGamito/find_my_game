class GameList
	attr_accessors :games_list
	def initialize(array)
		@game_list=array
	end
	def remove(remove_list, array=@game_list)
		remove_list.each do |del|
			@game_list.delete(del)
		end
	end
	def game_list
		@games_list
	end
end