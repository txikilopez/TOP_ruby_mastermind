# require_relative './human_guess'
# require_relative './game'

class ComputerCodeMaker
  PEG_COLORS = %w(r b g o y p)
  attr_reader :code

  def initialize()
    create_code
  end
private
  def create_code()
    @code = []
    4.times do |i|
      @code[i] = PEG_COLORS.sample
    end
    @code
  end

end