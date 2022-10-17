class Player
  attr_accessor :lives, :name

  # each player starts with 3 lives
  def initialize
    @lives = 3
    @name = name
  end

  # If wrong answer then the player lose a life.
  def lose_life
    @lives -= 1
  end

  # If lives > 0 then the player is still alive
  def alive?
    @lives > 0
  end
end