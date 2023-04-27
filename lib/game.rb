require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :current_player, :status, :board, :players

  def initialize
    @board = Board.new
    @players = [Player.new("Joueur 1", "X"), Player.new("Joueur 2", "O")]
    @current_player = players.sample # permet de choisir le joueur qui commence aléatoirement
    @status = "en cours"
  end

  def turn
    loop do
      board.display
      puts "#{current_player.name}, c'est votre tour."
      puts "Choisissez une case (de 1 à 9) où jouer : "
      choice = gets.chomp.to_i
      unless board.valid_input?(choice)
        puts "Choix invalide. Veuillez choisir une case entre 1 et 9."
        next
      end
      unless board.valid_move?(choice)
        puts "Cette case est déjà prise. Veuillez en choisir une autre."
        next
      end
      board.play_turn(current_player)
      if board.victory?
        @status = current_player
        break
      elsif board.count_turn == 9
        @status = "nul"
        break
      end
      @current_player = players.find { |player| player != current_player }
    end
    game_end
  end

  def new_round
    @board = Board.new
    @status = "en cours"
    @current_player = players.find { |player| player != current_player }
    turn
  end

  def game_end
    board.display
    case @status
    when "nul"
      puts "C'est un match nul."
    else
      puts "Félicitations, #{current_player.name}, vous avez gagné!"
    end
    print "Voulez-vous jouer à nouveau ? (Y/N): "
    answer = gets.chomp.upcase
    case answer
    when "Y"
      new_round
    when "N"
      puts "Merci d'avoir joué. Au revoir !"
    else
      puts "Entrée invalide. Au revoir !"
    end
  end
end
