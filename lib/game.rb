class Game

  def initialize
    @computer_code = ComputerCodeMaker.new()
    @generated_code = @computer_code.code
  end

  def feedback(array)
    if array.length != 4
      puts 'please enter 4 colors'
      return feedback(array)
    end

    w_pegs = white_pegs(array)
    r_pegs = red_pegs(array)
    [w_pegs - r_pegs, r_pegs]
  end

  def white_pegs(array)
    wp_count = 0
    array.each do |pin|
      @generated_code.include?(pin) ? wp_count += 1 : wp_count
    end
    wp_count
  end

  def red_pegs(array)
    rp_count = 0
    array.each_with_index do |pin, index|
      @generated_code[index] == pin ? rp_count += 1 : rp_count
    end
    rp_count
  end
end