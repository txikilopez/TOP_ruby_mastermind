require_relative './computer_code_maker'
require_relative './instructions'
require_relative './human_guess'
require 'colorize'

class Game
  LIFE = 12
  

  def initialize
    Instructions.new(LIFE)
    who_plays = gets.chomp.to_i

    if who_plays == 1
      computer_code = ComputerCodeMaker.new()
      code_to_guess = computer_code.code
      HumanGuess.new(LIFE, code_to_guess)
    else
      puts "work in progess"
    end
  end
end