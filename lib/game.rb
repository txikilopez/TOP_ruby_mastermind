require 'colorize'
require_relative './computer_code_maker'
require_relative './instructions'
require_relative './human_guess'
require_relative './computer_guess'
require_relative './guesser'

class Game < Guesser
  LIFE = 12
  COLORS = ComputerCodeMaker::PEG_COLORS
  # attr_accessor :human_code 
  def initialize
    # puts ComputerCodeMaker.ancestors
    # puts ComputerGuess.ancestors
    Instructions.new(LIFE)
    who_plays = gets.chomp.to_i

    if who_plays == 1
      computer_code = ComputerCodeMaker.new()
      code_to_guess = computer_code.code
      HumanGuess.new(LIFE, code_to_guess)
    else
      puts 'Please enter code to be guessed:'
      puts '(choose from [red (r), green (g), blue (b), yellow (y), orange (o), purple (p)])'
      human_code = gets.chomp.split
      human_code = check_input(human_code)
      ComputerGuess.new(LIFE, human_code)
    end
  end
end

