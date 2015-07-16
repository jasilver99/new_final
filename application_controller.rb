require 'bundler'
require 'twilio-ruby'
Bundler.require

require './models/model.rb'

class MyApp < Sinatra::Base

  get'/' do
    erb :index
  end
  
 
  post '/results' do
    @choice = params[:compliment]
    @message = compliment(@choice)
    @number = params[:number]
    @name = params[:name]
    @name2 = params[:name2]
    send_message(@message, @name, @number, @name2)
    erb :results
  end
end