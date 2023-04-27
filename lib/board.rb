require_relative 'boardcase'

class Board 
  attr_accessor :board_cases, :count_turn

  def initialize
    # Le plateau est représenté par un hash qui associe chaque numéro de case (1 à 9) avec une instance de BoardCase
    @board_cases = {}
    # Le compteur de tours permet de savoir quand le plateau est rempli et qu'il n'y a pas de vainqueur
    @count_turn = 0

    # On boucle sur les numéros de case pour créer les instances de BoardCase correspondantes
    (1..9).each do |num|
      @board_cases[num] = BoardCase.new(num)
    end
  end

  # Affiche le plateau de jeu à l'écran
  def display_board
    puts " #{board_cases[1].value} | #{board_cases[2].value} | #{board_cases[3].value} "
    puts "---+---+---"
    puts " #{board_cases[4].value} | #{board_cases[5].value} | #{board_cases[6].value} "
    puts "---+---+---"
    puts " #{board_cases[7].value} | #{board_cases[8].value} | #{board_cases[9].value} "
  end

  def play_turn(player)
    # Demande au joueur en cours de jouer une case, et stocke le choix dans la variable "choice"
    puts "#{player.name}, c'est à votre tour de jouer. Choisissez une case entre 1 et 9 :"
    choice = gets.chomp.to_i

    # Tant que la case choisie n'existe pas ou est déjà occupée, on redemande au joueur de choisir
    until (1..9).include?(choice) && @board_cases[choice].value == " "
      puts "Case invalide ou déjà jouée. Veuillez choisir une case libre entre 1 et 9 :"
      choice = gets.chomp.to_i
    end

    # On enregistre la valeur du symbole du joueur dans la case choisie, et on incrémente le compteur de tours
    @board_cases[choice].value = player.symbol
    @count_turn += 1
  end

  def victory?
    # Les combinaisons gagnantes sont stockées dans un array
    win_combinations = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9], # horizontale
      [1, 4, 7], [2, 5, 8], [3, 6, 9], # verticale
      [1, 5, 9], [3, 5, 7] # diagonale
    ]

    # On boucle sur toutes les combinaisons gagnantes pour vérifier si un joueur a aligné les cases correspondantes
    win_combinations.each do |combo|
      # On récupère les valeurs des cases correspondantes dans un array "values"
      values = combo.map { |num| @board_cases[num].value }
      # Si toutes les cases ont la même valeur (et que ce n'est pas une case vide), on retourne "true"
      if values.uniq.length == 1 && values.first != " "
        return true
      end
    end

    # Si on arrive à la 9ème case sans vainqueur, on retourne "true"
    if @count_turn == 9
      return true
    end

    # Sinon, on retourne "false"
    return false
  end
end



