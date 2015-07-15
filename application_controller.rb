require 'bundler'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/vote' do
    erb :under_construction
  end

end