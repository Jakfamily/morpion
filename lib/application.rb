require 'bundler'
Bundler.require

require_relative 'player'
require_relative 'board'
require_relative 'game'
require_relative 'show'

class Application
  def perform
    #Affichage du message d'accueil
    puts "--------------------------------------------------".yellow
    puts "|Bienvenue dans le jeu du Morpion !              |".yellow
    puts "|Le but du jeu aligner le premier 3 symbole !    |".yellow
    puts "--------------------------------------------------".yellow
    puts
    puts "Initialisation des joueurs ....".green
    puts
    # Initialisation des joueurs
    puts "Joueur 1, quel est votre nom ?".cyan
    name1 = gets.chomp
    player1 = Player.new(name1, "X")
    puts
    puts "Joueur 2, quel est votre nom ?".cyan
    name2 = gets.chomp
    player2 = Player.new(name2, "O")
    
    players = [player1, player2]

    # Initialisation de la partie
    board = Board.new
    show = Show.new
    game = Game.new(board, players)

    # Boucle principale de la partie
    while game.status == nil
      puts "\n#{game.current_player.name}, c'est à vous de jouer !"
      game.turn
    end
      
    # Fin de partie
    game.game_end
  end
end

