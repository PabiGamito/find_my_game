require 'bundler'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/vote' do
    erb :under_construction
  end

  post '/results'
    puts params
    @answer= params[:first_answer]
    if @answer == "An answer"
      @next_page = "./next_page"
    elsif condition
      @other_page == ""
    end
  end

end