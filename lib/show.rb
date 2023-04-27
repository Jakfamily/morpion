require_relative 'board'

class Show
  def show_board(board)
    puts " #{board.cases[1].value} | #{board.cases[2].value} | #{board.cases[3].value} "
    puts "---|---|---"
    puts " #{board.cases[4].value} | #{board.cases[5].value} | #{board.cases[6].value} "
    puts "---|---|---"
    puts " #{board.cases[7].value} | #{board.cases[8].value} | #{board.cases[9].value} "
  end
end

