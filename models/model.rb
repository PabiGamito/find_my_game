class GameList
	
	attr_accessor :game_list
	
	def initialize
		@game_list=["wow", 
		"minecraft", 
		"diablo", 
		"rez", 
		"monkeyball", 
		"tetris", 
		"ikaruga", 
		"lumines", 
		"limbo", 
		"pacman", 
		"punchout", 
		"braid", 
		"portal", 
		"supersmashbros", 
		"sims", 
		"citiesskyline", 
		"simcity", 
		"easports", 
		"mortalkombat", 
		"mariokart", 
		"rockband"]
	end
	
	def remove(remove_list)
		remove_list.each do |del|
			@game_list.delete(del)
		end
 		return @game_list
	end
	
def game_list
	@game_list
end
end