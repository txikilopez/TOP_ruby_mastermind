require_relative './computer_code_maker'

class Guesser
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

end