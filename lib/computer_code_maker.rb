class ComputerCodeMaker
  PEG_COLORS = %w(r b g o y p)
  SMALL_PEGS = %w(w r) #red for correct color and place, w for correct color wrong place

  attr_reader :code

  def initialize()
    code
  end

  def create_code()
    @code = []
    4.times do |i|
      @code[i] = PEG_COLORS.sample
    end
    @code
  end

end