# require_relative './human_guess'
# require_relative './game'

class ComputerCodeMaker
  PEG_COLORS = %w(r b g o y p)
  attr_reader :code

  def initialize()
    create_code
  end

  def create_guess(prior_guess, code)
    
    new_guess = create_code
    red_peg_array = keep_red_pegs(prior_guess, code)
    
    4.times do |i|
      red_peg_array[i] != nil ? new_guess[i] = red_peg_array[i] : false
    end
    new_guess
  end

  private

  def keep_red_pegs(array, code)
    revised_array = []
    array.each_with_index do |pin, index|
      code[index] == pin ? revised_array[index] = pin : false
    end
    revised_array
  end

  def create_code()
    @code = []
    4.times do |i|
      @code[i] = PEG_COLORS.sample
    end
    @code
  end



end