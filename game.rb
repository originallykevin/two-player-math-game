require './player'
require './question'

class Game
  
  def initialize

  end
  
  ## init players, questions, round
  ## create player, how many rounds. after each round. init new question
  def start
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_round = 1
    players = [@player1, @player2]
    @current_player = nil
    
    while !game_over?
      puts "---- NEW TURN ----"
      @current_player = players[@current_round % 2]
      round 
      @current_round += 1

    end 
  
  end

  def round
    question = Question.new
    puts "#{@current_player.name}: #{question.question}"
    answer = gets.chomp ## user input

    if !question.good_answer?(answer.to_i) 
      @current_player.lose_life
    end
    puts game_lives
  end

  def game_lives
    puts "#{@player1.name} #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
  end

  def game_over?
    @player1.dead? || @player2.dead?
  end
end
