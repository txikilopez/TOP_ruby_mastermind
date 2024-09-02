require_relative './guesser'
require_relative './computer_code_maker'


class ComputerGuess < Guesser
  def initialize(lives, code)
    @life = lives
    @code_to_guess = code
    computer_play
  end
  
  def computer_play
    turn = 1
    while turn <= @life do
      computer_code_guess = ComputerCodeMaker.new()
      code_guessed = computer_code_guess.code
      # puts present_code(code_guessed)
      if code_guessed == @code_to_guess
        return puts "computer guessed #{present_code(code_guessed)}"
      elsif turn == @life
        return puts "computer didn't guess after 12 turns"
      else
        puts "\nTurn #{turn}. Code guessed: #{present_code(code_guessed)}"
        turn += 1
      end
    end
  end
end