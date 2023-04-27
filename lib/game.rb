require_relative 'board'
require_relative 'player'
require_relative 'show'

# Définition de la classe Game
class Game
  # Attributs accessibles en lecture et en écriture : joueur courant, état du jeu, plateau, joueurs
  attr_accessor :current_player, :status, :board, :players

  # Constructeur de la classe Game
  def initialize
    # Initialisation des joueurs avec leur nom et symbole (X ou O)
    @players = [Player.new("Joueur 1", "X"), Player.new("Joueur 2", "O")]
    # Initialisation du plateau de jeu
    @board = Board.new
    # Le joueur courant est le premier joueur de la liste des joueurs
    @current_player = @players[0]
    # L'état du jeu est "en cours"
    @status = "on going"
  end

  # Méthode pour jouer un tour
  def turn
    # Affichage du plateau de jeu
    Show.new.show_board(@board)
    # Le joueur courant joue un coup sur le plateau
    @board.play_turn(@current_player)
    # Si le joueur courant a gagné
    if @board.victory?
      # L'état du jeu est le joueur courant
      @status = @current_player
    # Si tous les coups ont été joués et personne n'a gagné
    elsif @board.count_turn == 9
      # L'état du jeu est "nul"
      @status = "nul"
    # Sinon, on passe au joueur suivant
    else
      @current_player = @players[(@players.index(@current_player) + 1) % 2]
    end
  end

  # Méthode pour commencer un nouveau tour
  def new_round
    # Initialisation d'un nouveau plateau
    @board = Board.new
    # Le joueur courant est le premier joueur de la liste des joueurs
    @current_player = @players[0]
    # L'état du jeu est "en cours"
    @status = "on going"
  end

  # Méthode pour terminer la partie
  def game_end
    # Affichage du plateau de jeu
    Show.new.show_board(@board)
    # En fonction de l'état du jeu
    case @status
    # Si c'est un match nul
    when "nul"
      puts "Match nul !"
    # Si un joueur a gagné
    when Player
      puts "#{status.name} remporte la partie !"
    end
  end
end
