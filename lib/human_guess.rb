class HumanGuess
  @@prior_turns = []
  @@flags = []

  def initialize(lives, code_input)
    @code_to_guess = code_input
    play(lives)

  end

  def play(lives)
    turns = 1
    while turns <= lives do
      puts "\nTurn #{turns}. Select 4 colors from [r g b y o p]. Separate with a space and press Enter"
      player_selection = gets.chomp.split(" ")
      player_selection = check_input(player_selection)
      
      result = feedback(player_selection)
      
      @@prior_turns.push(player_selection)
      @@flags.push(": #{result[0]}w, #{result[1]}r")


      if result[1] == 4
        return puts "Winner! Guessed in #{turns} turns. Code was #{present_code(@code_to_guess)}".green
      elsif turns == lives
        return puts "Sorry! reached max number of tries. Code was #{present_code(@code_to_guess)}".red
      else
        puts "#{present_code(player_selection)} gets #{result[0]} white pegs and #{result[1]} red."
        puts "\nPrior choices below:"
        prior_choices(turns)
        turns +=1
      end
    end  
  end

  def present_code(array)
    "[#{array.join(" ")}]"
  end

  def prior_choices(turn)
    @@prior_turns.each_with_index do |play, idx|
      puts "#{idx+1}.- #{present_code(play)}#{@@flags[idx]}"
    end
  end


  def check_input(arr)
    colors = ComputerCodeMaker::PEG_COLORS
    error_message = "wrong input, please select 4 colors:"
    
    while arr.length != 4 || !(arr - colors).empty? do
      puts error_message
      arr = gets.chomp.split(" ")
    end
    return arr
  end

  def feedback(array)
    w_pegs = white_pegs(array)
    r_pegs = red_pegs(array)
    [[0,w_pegs - r_pegs].max, r_pegs]
  end

  def white_pegs(array)
    wp_count = 0
    original_array = array.dup
    # uniq_key = @code_to_guess.uniq
    array.uniq.each do |pin|
      # @code_to_guess.include?(pin) ? wp_count += 1 : wp_count
      wp_count += [@code_to_guess.count(pin), original_array.count(pin)].min
      # wp_count += uniq_key.count(pin)
    end
    wp_count
  end

  def red_pegs(array)
    rp_count = 0
    array.each_with_index do |pin, index|
      @code_to_guess[index] == pin ? rp_count += 1 : rp_count
    end
    rp_count
  end
end