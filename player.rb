class Player
  attr_reader :lives, :name

  # each player starts with 3 lives
  def initialize(name)
    @lives = 3
    @name = name
  end

  # If wrong answer then the player lose a life.
  def lose_life
    @lives -= 1
  end

  # If lives = 0 then the player is dead
  def dead?
    @lives.zero?
  end
end