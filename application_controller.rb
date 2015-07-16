require 'bundler'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

	get '/questions' do
		@qnum = 1
		@questions = "Do you want to avoid using your brain?"
# 		@games=[“GTA”, “Tetris”, “COD”, “Skyrim”, “WOW”, “Zelda”, “Minecraft”, “Mario_Bros”, “Final_Fantasy”, “Street_Fighter”, “Pac_Man”, “Half_Life”, “BioShock”, “Portal”, “Diablo”, “Fallout”, “God_of_War”, “The_Last of_Us”, “Super_Mario_Galaxy”, “Mass_Effect”, “LOL”, “Batman”, “Halo”]
		erb :questions
  end

	post '/questions' do
		puts params
		@qnum = params[:qnum].to_i
		@answer= params[:ans]
		if @answer == "No" && @qnum == 1
			@questions = "Maximum Creativity?"
			@qnum += 1
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