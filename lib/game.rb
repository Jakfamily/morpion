require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :current_player, :status, :board, :players

  def initialize
    @board = Board.new # initialisation du plateau de jeu
    @players = [Player.new("Joueur 1", "X"), Player.new("Joueur 2", "O")] # initialisation des joueurs
    @current_player = players.sample # sélection aléatoire du joueur qui commence
    @status = "en cours" # statut du jeu
  end

  def turn
    loop do
      board.display # affichage du plateau de jeu
      puts "#{current_player.name}, c'est votre tour."
      puts "Choisissez une case (de 1 à 9) où jouer : "
      choice = gets.chomp.to_i
      unless board.valid_input?(choice) # vérification que le choix de l'utilisateur est valide
        puts "Choix invalide. Veuillez choisir une case entre 1 et 9."
        next
      end
      unless board.valid_move?(choice) # vérification que la case n'est pas déjà prise
        puts "Cette case est déjà prise. Veuillez en choisir une autre."
        next
      end
      board.play_turn(current_player) # joueur joue sur la case choisie
      if board.victory? # vérification de la victoire
        @status = current_player # le joueur actuel a gagné
        break
      elsif board.count_turn == 9 # vérification d'un match nul
        @status = "nul"
        break
      end
      @current_player = players.find { |player| player != current_player } # changement de joueur
    end
    game_end # fin de partie
  end

  def new_round
    @board = Board.new # création d'un nouveau plateau de jeu
    @status = "en cours" # réinitialisation du statut
    @current_player = players.find { |player| player != current_player } # changement de joueur
    turn # début d'un nouveau tour
  end

  def game_end
    board.display # affichage du plateau de jeu
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
      new_round # début d'une nouvelle partie
    when "N"
      puts "Merci d'avoir joué. Au revoir !"
    else
      puts "Entrée invalide. Au revoir !"
    end
  end
end

