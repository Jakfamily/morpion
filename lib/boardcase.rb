class BoardCase
  attr_accessor :value, :id

  def initialize(id)
    # Chaque instance de BoardCase possède un identifiant unique et une valeur par défaut de " "
    @id = id
    @value = " "
  end

  # Change la valeur de la case en une nouvelle valeur spécifiée
  def set_value(new_value)
    @value = new_value
  end
end

