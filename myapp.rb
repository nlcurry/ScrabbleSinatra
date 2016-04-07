require 'sinatra'
require './lib/player.rb'
require './lib/scoring.rb'
require './lib/tilebag.rb'

class MyApp < Sinatra::Base

	get '/' do
		erb :main
	end

	get '/score' do
		erb :score
	end

	post '/score' do
		@word = params[:word]
		@score = Scoring.score(@word)
		erb :score
	end

	get '/score-many' do
		erb :score_many
	end

	post '/score-many' do
		@words = params[:words].split
		@scores = []
		@words.each do |word|
			@scores.push(Scoring.score(word))
		end

		@match = @words.zip(@scores)
		@total_score = @scores.inject(:+)

		erb :score_many
	end

	run!
end