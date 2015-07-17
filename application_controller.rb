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
		@games_list_object = GameList.new
		puts @games_list_object.game_list
		
		#WE NEED TO GET RID OF THIS AND DO IT ANOTHER WAY
		@remove_list_q1_y = ["minecraft",  "tetris",  "lumines", "limbo",  "braid", "portal", "supersmashbros", "sims", "citiesskyline", "simcity", "easports", "mortalkombat", "mariokart"]
		@remove_list_q1_n = ["wow", "diablo", "monkeyball", "ikaruga",  "pacman", "punchout", "rockband"]	
		
		puts params
		@qnum = params[:qnum].to_i
		@answer = params[:ans]
		
		if @answer == "Yes"
			@ans_value=0
		elsif @answer == "No"
			@ans_value=1
		end
		
#------HASH FOR EACH QUESTION AND THE ONE THAT FOLLOWS------#
		#0=Yes ---- 1=No
		map={
			:avoid_brain => ["How are your reflexes?", "Maximum Creativity?"],
			:good_reflexes => ["Are you on drugs?", "Do you want to point and click click click...?"],
			:on_drugs => ["rez", "Do you want to feel like you are?"],
			:feel_on_drugs => ["unknown", "How's your timing?"],
			:good_timing => ["You want to rock out?", "Are 2 buttons too many for you?"],
			:rock_out => ["rockband", "ikaruba"],
			:two_buttons => ["pacman", "punchout"],
			:point_and_click => ["Do you plan on playing for the next week straight?", "Do you want the hardest game ever?"],
			:hardest_game => ["unknow", "monkeyball"],
			:play_week => ["wow", "diablo"],
			
			}
		
		:avoid_brain = "Do you want to avoid using your brain?"
		:good_reflexes = "How are your reflexes?"
		@questions = map(:avoid_brain)(@ans_value)
# 		@games = params[:games]
		
# #------------FIRST LINE OF QUESTIONS----------------#
# 		if @answer == "Yes" && @qnum == 1
# 			@questions = "Are your reflexes amazing?"
# 			@qnum += 1
# 			remove_list = @remove_list_q1_y
# 			@games_list_object.remove(remove_list)
			
# 			elsif @answer == "No" && @qnum == 1
# 			@questions = "Maximum Creativity?"
# 			@qnum += 1
# 			remove_list = @remove_list_q1_n
# 			@games_list_object.remove(remove_list)
# 			puts @games_list_object.game_list

# #----------SECOND LINE OF QUESTION------------#
# 		elsif @answer == "No" && @qnum == 2 && @question="Are your reflexes amazing?"
# 			@questions = "Do you want to point & click, click, click...?"
# 			@qnum += 1
# 			delete_list = ["rez", "rockband", "ikaruga", "pacman", "punchout"] #Missing one
# 			@games_list_object.remove(remove_list)
			
# 		elsif @answer == "Yes" && @qnum == 2 && @question="Are your reflexes amazing?"
# 			@questions = "Are you on drugs?"
# 			@qnum += 1
# 			delete_list = ["rez", "rockband", "ikaruga", "pacman", "punchout"] #Missing one
# 			@games_list_object.remove(remove_list)
			
# 		else
# 			@questions = "There are no more questions"
# 		end
# 		puts @questions
		erb :questions
	end
end