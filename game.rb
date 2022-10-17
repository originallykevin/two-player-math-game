require './player'
require './question'

class Game
  
  ## init players, questions, round
  ## create player, how many rounds. after each round. init new question
  def start
    player1 = Player.new
    player2 = Player.new
    @current_round = 1
    players = [player1, player2]
    while player1.alive? || player2.alive? 
      current_player = players[@current_round % 2]
      round(current_player) 
      @current_round += 1
    end 
  end

  def round(player)
    question = Question.new
    puts question.question
    answer = gets.chomp ## user input

    if question.good_answer?(answer.to_i) 
    
    end
  end

  # def initialize

  # end
end
