class ComputerPlayer
  def initialize
    @colors = Code::COLORS
    @all_codes = @colors.repeated_permutation(Code::CODE_LENGTH).to_a
    @remaining_codes = @all_codes.dup
    @current_guess = ["R","R","G","G"]
  end

  def make_guess
    @current_guess ||= @remaining_codes.sample
  end

  def learn_from_feedback(exact, partial, guess)
    @remaining_codes.select! do |code|
      Code.new(code).compare(guess) == [exact, partial]
    end

    color_frequencies = count_color_frequencies(@remaining_codes)
    
    @current_guess = @remaining_codes.max_by do |code|
      code.sum { |color| color_frequencies[color] }
    end
  end

  def count_color_frequencies(codes)
    freq = Hash.new(0)

    codes.each do |code|
      code.each { |color| freq[color] += 1 }
    end

    freq
  end
end