require 'bundler'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

	get '/questions' do
		@qnum = 1
		@questions = "Hello this is q number 1"
		erb :questions
  end

	post '/questions' do
		puts params
		@qnum = params[:qnum].to_i
		@answer= params[:ans]
		if @answer == "No" && @qnum == 1
			@questions = "Next Question"
			@qnum += 1
		elsif @answer == "Yes" && @qnum == 1
			@questions = "Other next question"
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