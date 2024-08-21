require_relative './board'
require_relative './computer_code_maker'

class Game
  @@lifes = 12

  def initialize
    @computer_code = ComputerCodeMaker.new()
    @code_to_guess = @computer_code.code
    instructions
    puts "computer code is #{@code_to_guess}"
    play

  end

  def instructions
    puts 'Welcome to Mastermind. You will have 12 turns to guess the code'
    puts 'Code will be selected from a combination of the following colors:'
    puts '[red (r), green (g), blue (b), yellow (y), orange (o), purple (p)]'
    puts 'Colors can be repeated, but cannot be left blank. i.e [r r r g] is a possible code'
    puts 'Computer will pick and you will have to guess'
  end

  def play
    turns = 1
    while turns <= @@lifes do
      puts "\nTurn #{turns}. Select 4 colors from [r g b y o p]. Separate with a space"
      player_selection = gets.chomp.split(" ")
      player_selection = check_input(player_selection)
      
      result = feedback(player_selection)
      
      if result[1] == 4
        return puts "Winner! Guessed in #{turns} turns. Code was #{@code_to_guess}"
      elsif turns == @@lifes
        return puts "reached max number of tries"
      else
        puts "#{player_selection} gets #{result[0]} white pegs and #{result[1]} red."
        turns +=1
      end
    end  
  end

  def check_input(arr)
    colors = ComputerCodeMaker::PEG_COLORS
    error_message = "wrong input, please select 4 colors:"
    
    while arr.length != 4 || !(arr - colors).empty? do
      puts er ror_message
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
    array.uniq.each do |pin|
      # @code_to_guess.include?(pin) ? wp_count += 1 : wp_count
      wp_count += @code_to_guess.count(pin)
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