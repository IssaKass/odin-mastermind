module Messages
  class << self
    def welcome_message
      message = "🎯 Welcome to #{'Mastermind'.bold}!".colorize(:cyan)
      message += "\nAvailable colors: #{display_colors}"
      message += "\nGuess the 4-color code. Duplicates allowed."
      message += "\nYou have #{Mastermind::MAX_TURNS} attempts. Enter your guess like: RGBY"
      message
    end

    def ask_for_guess(turns_left)
      print "\nEnter guess (#{turns_left} left): ".light_blue
    end

    def invalid_guess_message
      "❌ Invalid guess. Use 4 letters from: #{display_colors}".red
    end

    def feedback_message(exact, partial)
      "=> Exact: #{exact}, Partial: #{partial}"
    end

    def win_message
      "\n🎉 #{'You cracked the code!'.bold.green}"
    end

    def lose_message(code)
      "\n💥 Out of turns! The code was: #{colorize_code(code)}"
    end

    def computer_guess(guess)
      "\nComputer's guess: #{guess}"
    end
    
    def creator_message
      "You are the code creator. Please enter your secret code." 
    end

    def guesser_message
      "You are the guesser. Guess the computer's secret code."
    end 

    def display_colors
      Code::COLORS.map { |c| Code.colored(c) }.join(" ")
    end
  
    def colorize_code(code)
      code.map { |c| Code.colored(c) }.join(" ")
    end
  end

end