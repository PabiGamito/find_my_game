require 'bundler'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

	get '/questions' do
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
		#There are three more games that I can't read the name off
		erb :questions
  end

	post '/questions' do
		puts params
		@qnum = params[:qnum].to_i
		@answer= params[:ans]
		if @answer == "No" && @qnum == 1
			@questions = "Maximum Creativity?"
			@qnum += 1
			@games -= ["minecraft",  
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
		elsif @answer == "Yes" && @qnum == 1
			@questions = "How good are your reflexes?"
			@qnum += 1
		elsif @answer == "No" && @qnum == 2
				@questions = "Hooray!"
			@qnum += 1
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