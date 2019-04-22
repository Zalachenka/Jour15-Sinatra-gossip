require 'sinatra'
require 'rubygems'
require 'shotgun'
require 'csv'

class Gossip
	attr_accessor :author, :content
	attr_reader :id
	@@all_gossips = []

	def initialize(author, content) #initializes new instances to gossip, name and content
 		  @author = author
 		  @content = content
 		  @id = @@all_gossips.length + 1
	end

	def save
		CSV.open("./db/gossip.csv", "ab") do |csv| #saves every array that includes a name and a gossip in rows, if pry put ".." before db, else take it of :)
  			csv << [@author, @content]
			end
	end

	def self.all
		@@all_gossips = []
  		CSV.read("./db/gossip.csv").each do |csv_line|
    	@@all_gossips << Gossip.new(csv_line[0], csv_line[1]) #method to get all the gossips on one page
  		end
  		return @@all_gossips
	end

	def find(id)

	end
end