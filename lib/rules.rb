require_relative './computer_code_maker'

class Rules
  def present_code(array)
    "[#{array.join(" ")}]"
  end

  def check_input(arr)
    colors = ComputerCodeMaker::PEG_COLORS
    error_message = "wrong input, please select 4 colors:"
    
    while arr.length != 4 || !(arr - colors).empty? do
      puts error_message
      arr = gets.chomp.split(" ")
    end
    return arr
  end

  def feedback(array, generated_code)
    w_pegs = white_pegs(array, generated_code)
    r_pegs = red_pegs(array, generated_code)
    [[0,w_pegs - r_pegs].max, r_pegs]
  end

  def white_pegs(array, generated_code)
    wp_count = 0
    original_array = array.dup
    array.uniq.each do |pin|
      wp_count += [generated_code.count(pin), original_array.count(pin)].min
    end
    wp_count
  end

  def red_pegs(array, generated_code)
    rp_count = 0
    array.each_with_index do |pin, index|
      generated_code[index] == pin ? rp_count += 1 : rp_count
    end
    rp_count
  end

end