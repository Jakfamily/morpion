require_relative 'player'
require_relative 'board'
require_relative 'board_case'
require_relative 'game'
require_relative 'show'
require 'colorize'

class Application
  def perform
    puts "--------------------------------------------------".yellow
    puts "|Bienvenue dans le jeu du Morpion !              |".yellow
    puts "|Le but du jeu aligner le premier 3 symbole !    |".yellow
    puts "--------------------------------------------------".yellow
    puts
    puts "Initialisation des joueurs ....".green
    puts
    puts "Entrez le nom du joueur 1 (X): ".blue
    player1 = Player.new(gets.chomp, "X")
    puts
    puts "Entrez le nom du joueur 2 (O): ".blue
    player2 = Player.new(gets.chomp, "O")
    players = [player1, player2]
    board = Board.new
    game = Game.new
    show = Show.new

    while game.status == "on going"
      show.show_board(board)
      game.turn
    end

    game.game_end
  end
end
