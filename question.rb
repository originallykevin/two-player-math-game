class Question
  attr_reader :question, :answer

  ## two numbers between 1-20 and sum of two is the answer
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
    @question = "What does #{@num1} plus #{@num2} equal?"
  end

  ## if answer is correct, then it will output "Yes! You are correct"
  def good_answer?(answer)
    ## if correct, puts and return true
    if answer == @answer 
      puts "YES! You are correct." 
      true
    ## otherwise incorrect, puts and return false
    else
      puts "Seriously? No!"
      false
    end
  end
end