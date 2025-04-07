# TODO implement logic

class ComputerPlayer
  def initialize
    @possible_colors = Code::COLORS
  end

  def make_guess
    guess = Code::COLORS.sample(4).join
    guess
  end

  def learn_from_feedback(exact, partial, guess)
    make_guess
  end
end