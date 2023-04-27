class Player
  attr_reader :name, :value

  # Initialise un nouveau joueur avec un nom et une valeur
  def initialize(name, value)
    @name = name
    @value = value
  end

  # Change la valeur du joueur
  def set_value(new_value)
    @value = new_value
  end
end
