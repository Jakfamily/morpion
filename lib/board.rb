require_relative 'board_case'

class Board
  attr_accessor :cases, :count_turn

  def initialize
    @cases = {}
    (1..9).each { |id| @cases[id] = BoardCase.new(id) }
    @count_turn = 0
  end

  def play_turn(player)
    puts "#{player.name}, c'est à toi de jouer (choisis une case de 1 à 9) :".red
    choice = gets.chomp.to_i
    until (1..9).include?(choice) && @cases[choice].value == " "
      puts "Choix invalide, réessaye :".red
      choice = gets.chomp.to_i
    end
    @cases[choice].value = player.value
    @count_turn += 1
  end

  def victory?
    winning_combinations = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    winning_combinations.any? { |combo| combo.all? { |id| @cases[id].value == "X" } || combo.all? { |id| @cases[id].value == "O" } }
  end
end
