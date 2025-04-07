class Player
  attr_reader :role

  def initialize
    @role = nil
  end

  def choose_role
    puts "Would you like to be the code creator or the guesser?"
    puts "1. Creator"
    puts "2. Guesser"

    choice = gets.chomp.to_i

    case choice
    when 1 then @role = :creator
    when 2 then @role = :guesser
    else 
      puts "Invalid choice, please select again."
      choose_role
    end
  end
end