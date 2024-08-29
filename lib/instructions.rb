class Instructions
  def initialize(lifes)
    puts `clear`
    puts "Welcome! The player will have #{lifes} turns to guess a code."
    puts 'Code will be selected from a combination of the following colors:'
    puts '[red (r), green (g), blue (b), yellow (y), orange (o), purple (p)]'
    puts 'Colors can be repeated, i.e [r r r g] is a possible code'
    puts "\nEach guess will be scored as follows:"
    puts 'Red means right color in right spot. White means right color in wrong spot'
    puts "\nDo you want to guess or create a code to be guessed by the computer?"
    puts "Please type 1 for guessing or 2 for coming up with a code"  
  end
end
