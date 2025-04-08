module Messages
  class << self
    def welcome_message(role = :creator)
      message = "🎯 Welcome to #{'Mastermind'.bold}!".colorize(:cyan)
      message += "\nAvailable colors: #{display_colors}"
      message += "\nGuess the 4-color code. Duplicates allowed."
      
      if role == :guesser
        message += "\nYou have #{Mastermind::MAX_TURNS} guesses to crack the code."
        message += "\nYou are the guesser. Enter your guess like: RGBY (4 colors)"
      else
        message += "\nYou are the code creator. Please enter your secret code."
      end

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

    def guesser_win_message
      "\n🎉 #{'You cracked the code!'.bold.green}"
    end

    def guesser_lose_message(code)
      "\n💥 Out of turns! The code was: #{colorize_code(code)}"
    end

    def creator_win_message
      "\n🤖 #{'Computer cracked your code!'.bold.red} Better luck next time!"
    end

    def creator_lose_message(code)
      "\n🧠 #{'You outsmarted the computer!'.bold.green} The code was: #{colorize_code(code)}"
    end

    def computer_guess(guess, turns_left)
      "\nComputer's guess ##{turns_left}: #{colorize_code(guess)}"
    end

    def display_colors
      Code::COLORS.map { |c| Code.colored(c) }.join(" ")
    end
  
    def colorize_code(code)
      code.map { |c| Code.colored(c) }.join(" ")
    end
  end

end