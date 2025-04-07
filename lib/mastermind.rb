require_relative 'code'
require_relative 'player'
require_relative 'computer_player'
require_relative 'validation'
require_relative 'messages'
require 'colorize'

class Mastermind
  include Validation 

  MAX_TURNS = 10

  def initialize
    @player = Player.new
    @computer_player = ComputerPlayer.new
    @code = nil
    @turns_left = MAX_TURNS
  end

  def start
    @player.choose_role
    
    if @player.role == :creator
      puts Messages.creator_message
      
      secret = gets.chomp.upcase
      unless valid_guess?(secret, Code::COLORS, Code::CODE_LENGTH)
        puts Messages.invalid_guess_message
        secret = gets.chomp.upcase
      end

      @code = Code.new(secret.chars)
      play_as_creator
    else 
      puts Messages.guesser_message
      @code = Code.new
      play_as_guesser
    end
  end

  private

  def play_as_guesser
    puts Messages.welcome_message

    while @turns_left > 0
      print Messages.ask_for_guess(@turns_left)
      input = gets.chomp

      unless valid_guess?(input, Code::COLORS, Code::CODE_LENGTH)
        puts Messages.invalid_guess_message
        next
      end

      exact, partial = @code.compare(input)
      puts Messages.feedback_message(exact, partial)

      if exact == Code::CODE_LENGTH
        puts Messages.win_message
        return
      end

      @turns_left -= 1
    end

    puts Messages.lose_message(@code.secret)
  end

  def play_as_creator
    while @turns_left > 0
      guess = @computer_player.make_guess
      puts Messages.computer_guess(guess)

      exact, partial = @code.compare(guess)
      puts Messages.feedback_message(exact, partial)

      if exact == Code::CODE_LENGTH
        puts Messages.lose_message(@code.secret)
        return
      end

      @computer_player.learn_from_feedback(exact,partial, guess)
      @turns_left -= 1
    end

    puts Messages.win_message
  end

end