require_relative 'board_case' # Importation de la classe BoardCase depuis le fichier board_case.rb

class Board
  attr_accessor :cases, :count_turn # Définition de deux attributs en lecture et écriture : cases pour les cases du plateau et count_turn pour le nombre de tours joués

  def initialize # Méthode qui est appelée lors de la création d'une instance de la classe Board
    @cases = {} # Initialisation du tableau de cases
    (1..9).each { |id| @cases[id] = BoardCase.new(id) } # Pour chaque numéro de case de 1 à 9, on crée une instance de BoardCase correspondante et on l'ajoute au tableau de cases
    @count_turn = 0 # Initialisation du nombre de tours à 0
  end

  def play_turn(player) # Méthode pour jouer un tour
    puts "#{player.name}, c'est à toi de jouer (choisis une case de 1 à 9) :".red # Affichage du message indiquant à quel joueur c'est de jouer et quelle case il doit choisir
    choice = gets.chomp.to_i # Récupération du choix du joueur sous forme de numéro de case
    until (1..9).include?(choice) && @cases[choice].value == " " # Tant que le choix n'est pas valide (hors de la plage de 1 à 9 ou case déjà occupée), on redemande un choix au joueur
      puts "Choix invalide, réessaye :".red
      choice = gets.chomp.to_i
    end
    @cases[choice].value = player.value # On attribue la valeur (X ou O) du joueur à la case correspondante
    @count_turn += 1 # On incrémente le nombre de tours joués
  end

  def victory? # Méthode pour vérifier si une victoire est survenue
    winning_combinations = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]] # Tableau contenant toutes les combinaisons gagnantes possibles
    winning_combinations.any? { |combo| combo.all? { |id| @cases[id].value == "X" } || combo.all? { |id| @cases[id].value == "O" } } # Si l'une des combinaisons gagnantes est complétée par un seul joueur (toutes les cases appartiennent à ce joueur), alors il y a victoire et on retourne true, sinon on retourne false
  end
end
