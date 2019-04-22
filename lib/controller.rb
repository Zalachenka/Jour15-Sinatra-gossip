require 'sinatra'
require 'rubygems'
require 'shotgun'
require 'csv'
require 'gossip'

class ApplicationController < Sinatra::Base
	get '/' do
		erb :index, locals: {gossips: Gossip.all} #display all gossips and author on the page
	end
	get '/gossips/new/' do
		erb :new_gossip #lets you create a new instance
	end
	post '/gossips/new/' do
  	Gossip.new(params["gossip_author"],params["gossip_content"]).save #lets you create a new gossip with name and content chosen
  	redirect '/'
	end
	get '/gossips/:id' do
		erb :index #associates a number to each gossip
	end
end
