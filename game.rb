require './player'
require './question'

class Game
  
  ## init players, questions, round
  ## create player, how many rounds. after each round. init new question
  def start
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_round = 1
    players = [@player1, @player2]
    @current_player = nil
    
    while !game_over?
      puts "---- NEW ROUND: ROUND #{@current_round} ----"
      ## index of current player is based off current round
      @current_player = players[@current_round % 2]
      round ## call new round 
      @current_round += 1
    end 
    
    ## if game over and player1 is still alive
    if game_over? && !@player1.dead?
      puts "Player 1 wins with a score of #{@player1.lives}/3"
    ## if game over and player2 is still alive
    else game_over? && !@player2.dead?
      puts "Player 2 wins with a score of #{@player2.lives}/3"
    end

    puts "---- GAME OVER AFTER #{@current_round} ROUNDS ----"
    puts "Good bye!"
  end

  def round
    question = Question.new
    puts "#{@current_player.name}: #{question.question}"
    answer = gets.chomp ## user input

    ## if incorrect answer, the player loses 1 life
    if !question.good_answer?(answer.to_i) 
      @current_player.lose_life
    end
    puts game_lives
  end

  ## output of player:lives
  def game_lives
    puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
  end

  ## game is over if either players have 0 lives
  def game_over?
    @player1.dead? || @player2.dead?
  end
end
