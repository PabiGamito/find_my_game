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
		curr_question = params[:question]
		@answer = params[:ans]
		
		if @answer == "Yes"
			@ans_value=0
		elsif @answer == "No"
			@ans_value=1
		end
		
#------HASH FOR EACH QUESTION AND THE ONE THAT FOLLOWS------#
		#0=Yes ---- 1=No
		map={
			"Do you want to avoid using your brain?" => {:next_q => ["Are your reflexes amazing?", "Maximum Creativity?"], :remove => []},
			
			"Are your reflexes amazing?" => {:next_q => ["Are you on drugs?", "Do you want to point and click click click...?"], :remove => []},
			
			"Are you on drugs?" => {:next_q =>["rez", "Do you want to feel like you are?"], :remove => []},
			
			"Do you want to feel like you are?" => {:next_q => ["Dangerously Flashing Lights Game", "Is your timing good?"], :remove => []},
			
			"Is your timing good?" => {:next_q => ["You want to rock out?", "Are 2 buttons too many for you?"], :remove => []},
			
			"You want to rock out?" => {:next_q => ["rockband", "ikaruba"], :remove => []},
			
			"Are 2 buttons too many for you?" => {:next_q => ["pacman", "punchout"], :remove => []},
			
			"Do you want to point and click click click...?" => {:next_q => ["Do you plan on playing for the next week straight?", "Do you want the hardest game ever?"], :remove => []},
			
			"Do you want the hardest game ever?" => {:next_q => ["unknow", "monkeyball"], :remove => []},
			
			"Do you plan on playing for the next week straight?" => {:next_q => ["wow", "diablo"], :remove => []},
			
			"Maximum Creativity?" => {:next_q => ["minecraft", "Do you want to solve some puzzles?"], :remove => []},
			
			#DO YOU ENJOY SIMULATIONS
			"Do you want to solve some puzzles?" => {:next_q => ["Do you feel the need for a storyline as well?", "Do you enjoy simulations?"], :remove => []},
			
			"Do you feel the need for a storyline as well?" => {:next_q => ["Are you an Edward Gorey fan?", "Kick it oldschool?"], :remove => []},
			
			"Are you an Edward Gorey fan?" => {:next_q => ["limbo", "Looking for crazy Japanese awesomeness?"], :remove => []},
			
			"Kick it oldschool?" => {:next_q => ["tetris", "lumines"], :remove => []},
			
			"Looking for crazy Japanese awesomeness?" => {:next_q => ["katamari_damacy", "Yes for shiny textures and No for indi-magic?"], :remove => []},
			
			"Yes for shiny textures and No for indi-magic?" => {:next_q => ["portal", "braid"], :remove => []},
		
		"Do you enjoy simulations?" => {:next_q => ["Do you want to be in charge of a City?", "Do you have multiple local players?"], :remove => []},
	
	"Do you want to be in charge of a City?" => {:next_q => ["cities_skyline", "sims"], :remove => []},

			"Do you have multiple local players?" => {:next_q => ["Button mashable?", "Do you want to lose yourself in another world?"], :remove => []},
			
			"Do you want to lose yourself in another world?" => {:next_q => ["Under Construction", "Under Construction"], :remove => []},
			
			"Button mashable?" => {:next_q => ["Does realistic violence upset you?", "Do you own any official team jerseys?"], :remove => []},
			
			"Does realistic violence upset you?" => {:next_q => ["super_smash_bros", "Do you like big-ass weapons?"], :remove => []},
			
			"Do you own any official team jerseys?" => {:next_q => ["easports", "Does the sound of squealing tires excite you?"], :remove => []},
			
			"Do you like big-ass weapons?" => {:next_q => ["soulcalibur", "Do you want to tear out your opponent's spine?"], :remove => []},
			
			"Does the sound of squealing tires excite you?" => {:next_q => ["Under Construction", "Under Construction"], :remove => []},
			
			"Do you want to tear out your opponent's spine?" => {:next_q => ["mortal_kombat", "unkown"], :remove => []},
			}
		
# 		:avoid_brain = "Do you want to avoid using your brain?"
# 		:good_reflexes = "How are your reflexes?"
	
		@results = map[curr_question][:next_q][@ans_value].upcase
		@questions = map[curr_question][:next_q][@ans_value]
# 		puts "---"
# 		puts @questions
		if @questions.include? '?'
			erb :questions
		elsif @questions=="Under Construction"
				erb :under_construction
		else
				erb :display
		end
# 		@remove_list = map[@questions][:remove]
		
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
		
	end
end