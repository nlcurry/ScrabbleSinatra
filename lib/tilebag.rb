class Tilebag
  attr_reader :tilebag

  def initialize
    #@tilebag = {}
    @tilebag = {
    "a"=>9, "b"=>2, "c"=>2, "d"=>4, "e"=>12, "f"=>2, "g"=>3, "h"=>2, "i"=>9,
    "j"=>1, "k"=>1, "l"=>4, "m"=>2, "n"=>6, "o"=>8, "p"=>2, "q"=>1, "r"=>6,
    "s"=>4, "t"=>6, "u"=>4, "v"=>2, "w"=>2, "x"=>1, "y"=>2, "z"=>1}

  end

  def draw_tiles(num)
    keys = []
    letters = []
    count = 0

    if self.tiles_remaining >= num
      while count < num
      	keys = (@tilebag.keys).shuffle
        letter = keys[0]
          if @tilebag[letter] > 0
            @tilebag[letter] = @tilebag[letter] - 1
            letters << letter
            count = count + 1
          end
      end
      return letters
    else
    	return "Out of tiles"
    end


  end

  def tiles_remaining
	 	values = @tilebag.values
	 	remaining = values.inject(0) { |sum, item| sum + item }
  	return remaining
  end

end