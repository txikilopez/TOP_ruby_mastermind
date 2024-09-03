require_relative './rules'
require_relative './computer_code_maker'

class ComputerGuess < Rules
  @@turns_chosen = []
  @@flags = []

  def initialize(lives, code)
    @life = lives
    puts "you have #{lives} lives"
    computer_play(code)
  end
  
  def computer_play(key_code)
    turn = 1
    computer_code_guess = ComputerCodeMaker.new()
    code_guessed_prior = []
    while turn <= @life do
      code_guessed = computer_code_guess.create_guess(code_guessed_prior,key_code)
      result = feedback(code_guessed, key_code)
      @@turns_chosen.push(code_guessed)
      @@flags.push(": #{result[0]}w, #{result[1]}r")

      if code_guessed == key_code
        return puts "computer guessed #{present_code(code_guessed)} in #{turn} turns".green
      elsif turn == @life
        puts "\nTurn #{turn}. Code guessed: #{present_code(code_guessed)}"
        prior_choices(@@turns_chosen, @@flags)
        return puts "computer didn't guess after 12 turns. Code was #{present_code(key_code)}".red
      else
        puts "Turn #{turn}. Code guessed: #{present_code(code_guessed)}"
        turn += 1
        code_guessed_prior = code_guessed
      end
    end
   puts "\n this is the board"
    prior_choices(@@turns_chosen, @@flags)
  end

end