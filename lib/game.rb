require_relative 'board'
require_relative 'player'
require_relative 'show'

class Game
  attr_accessor :current_player, :status, :board, :players

  def initialize
    @players = [Player.new("Joueur 1", "X"), Player.new("Joueur 2", "O")]
    @board = Board.new
    @current_player = @players[0]
    @status = "on going"
  end

  def turn
    Show.new.show_board(@board)
    @board.play_turn(@current_player)
    if @board.victory?
      @status = @current_player
    elsif @board.count_turn == 9
      @status = "nul"
    else
      @current_player = @players[(@players.index(@current_player) + 1) % 2]
    end
  end

  def new_round
    @board = Board.new
    @current_player = @players[0]
    @status = "on going"
  end

  def game_end
    Show.new.show_board(@board)
    case @status
    when "nul"
      puts "Match nul !"
    when Player
      puts "#{status.name} remporte la partie !"
    end
  end
end



