require 'bundler'
Bundler.require

require './models/model.rb'

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

	get '/questions' do
 		@qnum = 1
 		@questions = "Do you want to avoid using your brain?"
# 		@games=["wow", 
# 		"minecraft", 
# 		"diablo", 
# 		"rez", 
# 		"monkeyball", 
# 		"tetris", 
# 		"ikaruga", 
# 		"lumines", 
# 		"limbo", 
# 		"pacman", 
# 		"punchout", 
# 		"braid", 
# 		"portal", 
# 		"supersmashbros", 
# 		"sims", 
# 		"citiesskyline", 
# 		"simcity", 
# 		"easports", 
# 		"mortalkombat", 
# 		"mariokart", 
# 		"rockband"]
# 		puts "test"
# 		#puts @games
# 		@games_list_object = GameList.new(@games)
# 		puts @games_list_object.game_list

		#There are three more games that I can't read the name off
		erb :questions
  end

	post '/questions' do
		
		@qnum = 1
		@questions = "Do you want to avoid using your brain?"
		@games=["wow", 
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
		@games_list_object = GameList.new(@games)
		puts @games_list_object.game_list
		
		puts params
		@qnum = params[:qnum].to_i
		@answer = params[:ans]
# 		@games = params[:games]
		if @answer == "No" && @qnum == 1
			@questions = "Maximum Creativity?"
			@qnum += 1
			remove_list = ["wow", 
  			"diablo", 
				"rez", 
				"monkeyball", 
				"ikaruga",  
				"pacman", 
				"punchout",
				"rockband"]
			@games_list_object.remove(remove_list)
			puts @games_list_object.game_list
		elsif @answer == "Yes" && @qnum == 1
			@questions = "Are your reflexes amazing?"
			@qnum += 1
			remove_list = ["minecraft",  
				"tetris",  
				"lumines", 
				"limbo",  
				"braid", 
				"portal", 
				"supersmashbros", 
				"sims", 
				"citiesskyline", 
				"simcity", 
				"easports", 
				"mortalkombat", 
				"mariokart"]
			#Missing two games	
			@games_list_object.remove(remove_list)
		elsif @answer == "No" && @qnum == 2
			@questions = "Do you want to point & click, click, click...?"
			@qnum += 1
			delete_list = ["rez", "rockband", "ikaruga", "pacman", "punchout"] #Missing one
			delete_list.each do |del|
				@games.delete(del)
			end
			puts @games
		elsif @answer == "Yes" && @qnum == 2
			@questions = "Other next question"
			@qnum += 1
		else
			@questions = "There are no more questions"
		end
		puts @questions
		erb :questions
  end

end