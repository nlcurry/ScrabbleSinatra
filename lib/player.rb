class Player
	attr_accessor :name

	def initialize (name)
		@name = name
	end

	def hash_players
		hash_players = {
			"Suzanne" => ["cramps", "develop", "mixup", "doggies"],
			"Jeremy" => ["zebra", "naysays", "pigsty"],
			"Nadine" => ["mice"]
		}
	end

	def plays
		played_words = []
		hash_players.each do |name, words|
			if @name == name
				played_words += words
			end
		end
		return played_words
	end

	def self.score(word)
		super
	end

	def play(word)
		if won? == true
			return false
		else
			hash_players.each do |name, words|
				if @name == name
					words << word
				end
			end
			return Scoring.score(word)
		end
	end

	def total_score
	 	total_array_values = 0
	 	hash_players.each do |name, array|
	 		if @name == name
	 			array.each do |word|
	 				total_array_values += Scoring.score(word)
	 			end
	 		end
	 	end
	 	return total_array_values
	 end

	def won?
		if total_score >100
	 		return true
	 	else
	 		return false
	 	end
	end

	def highest_scoring_word
		win_word = ""
		hash_players.each do |name,array|
			if @name == name
				win_word = Scoring.highest_score_from(array)
			end
		end
		return win_word
	end

	def highest_word_score
		highest_score = 0
		highest_score = Scoring.score(highest_scoring_word)
	end

	tiles = []

	def tiles
		self.draw_tiles
		return tiles
	end

	def draw_tiles
		tiles = self.tiles
		tiles_needed = 7 - tiles.length
		tiles = Tilebag.draw_tiles(tiles_needed)
	end

end