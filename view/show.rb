require_relative 'board'

class Show

  def show_board(board)
    puts "   1   2   3"
    puts "A  #{board.boardcase["A1"].value} | #{board.boardcase["A2"].value} | #{board.boardcase["A3"].value} "
    puts "  ---|---|---"
    puts "B  #{board.boardcase["B1"].value} | #{board.boardcase["B2"].value} | #{board.boardcase["B3"].value} "
    puts "  ---|---|---"
    puts "C  #{board.boardcase["C1"].value} | #{board.boardcase["C2"].value} | #{board.boardcase["C3"].value} "
    puts "\n"
  end

end
