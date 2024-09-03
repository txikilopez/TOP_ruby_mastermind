require_relative './rules'
require_relative './computer_code_maker'

class HumanGuess < Rules
  @@prior_turns = []
  @@flags = []

  def initialize(lives, code_input)
    code_to_guess = code_input
    # p code_to_guess
    human_play(lives, code_to_guess)
  end

  def human_play(lives, generated_code)
    turns = 1
    while turns <= lives do
      puts "\nTurn #{turns}. Select 4 colors from [r g b y o p]. Separate with space and press Enter"
      player_selection = gets.chomp.split(" ")
      player_selection = check_input(player_selection)
      
      result = feedback(player_selection, generated_code)
      
      @@prior_turns.push(player_selection)
      @@flags.push(": #{result[0]}w, #{result[1]}r")

      if result[1] == 4
        return puts "Winner! Guessed in #{turns} turns. Code was #{present_code(generated_code)}".green
      elsif turns == lives
        puts "#{present_code(player_selection)} gets #{result[0]} white pegs and #{result[1]} red."
        return puts "Sorry! reached max number of tries. Code was #{present_code(generated_code)}".red
      else
        puts "#{present_code(player_selection)} gets #{result[0]} white pegs and #{result[1]} red."
        puts "\nPrior choices below:"
        prior_choices(@@prior_turns, @@flags)
        turns +=1
      end
    end  
  end
end









