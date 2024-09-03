require_relative './rules'
require_relative './computer_code_maker'

class ComputerGuess < Rules
  @@turns_chosen = []
  @@flags = []

  def initialize(lives, code)
    @life = lives
    puts "you have #{lives} lives"
    @code_to_guess = code
    computer_play
  end
  
  def computer_play
    turn = 1
    while turn <= @life do
      computer_code_guess = ComputerCodeMaker.new()
      code_guessed = computer_code_guess.code
      result = feedback(code_guessed, @code_to_guess)
      @@turns_chosen.push(code_guessed)
      @@flags.push(": #{result[0]}w, #{result[1]}r")

      if code_guessed == @code_to_guess
        return puts "computer guessed #{present_code(code_guessed)}"
      elsif turn == @life
        puts "\nTurn #{turn}. Code guessed: #{present_code(code_guessed)}"
        prior_choices(@@turns_chosen, @@flags)
        return puts "computer didn't guess after 12 turns"
      else
        puts "Turn #{turn}. Code guessed: #{present_code(code_guessed)}"
        turn += 1
      end
    end
   puts "\n this is the board"
    prior_choices(@@turns_chosen, @@flags)
  end
end