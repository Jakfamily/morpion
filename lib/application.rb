require_relative 'player'
require_relative 'board'
require_relative 'board_case'
require_relative 'game'
require_relative 'show'
require 'colorize'

# Définition de la classe Application
class Application
  # Méthode pour lancer l'application
  def perform
    # Affichage de la bannière d'accueil
    puts "--------------------------------------------------".yellow
    puts "|Bienvenue dans le jeu du Morpion !              |".yellow
    puts "|Le but du jeu aligner le premier 3 symbole !    |".yellow
    puts "--------------------------------------------------".yellow
    puts
    # Demande du nom du joueur 1 et création du joueur 1
    puts "Initialisation des joueurs ....".green
    puts
    puts "Entrez le nom du joueur 1 (X): ".blue
    player1 = Player.new(gets.chomp, "X")
    puts
    # Demande du nom du joueur 2 et création du joueur 2
    puts "Entrez le nom du joueur 2 (O): ".blue
    player2 = Player.new(gets.chomp, "O")
    # Création de la liste des joueurs
    players = [player1, player2]
    # Création du plateau de jeu
    board = Board.new
    # Création de la partie
    game = Game.new
    # Création de l'objet d'affichage
    show = Show.new

    # Boucle tant que la partie est en cours
    while game.status == "on going"
      # Affichage du plateau de jeu
      show.show_board(board)
      # Un tour est joué
      game.turn
    end

    # Affichage de la fin de partie
    game.game_end
  end
end
