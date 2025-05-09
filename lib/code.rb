require 'colorize'

class Code
  COLORS = ["R","G","B","Y","C","M"].freeze
  CODE_LENGTH = 4
  COLOR_MAP = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow,
    "C" => :cyan,
    "M" => :magenta
  }.freeze

  
  def self.colored(char)
    COLOR_MAP[char] ? char.colorize(COLOR_MAP[char]) : char
  end
  
  attr_reader :secret

  def initialize(secret = nil)
    @secret = secret ||  Array.new(CODE_LENGTH) { COLORS.sample }
  end

  def compare(guess)
    guess_copy = Code.normalize_guess(guess)
    secret_copy = @secret.dup
    exact, partial = 0, 0

    guess_copy.each_with_index do |char, idx|
      if char == secret_copy[idx]
        exact += 1
        guess_copy[idx] = nil
        secret_copy[idx] = nil
      end
    end

    guess_copy.each_with_index do |char, _|
      next if char.nil?

      if secret_copy.include?(char)
        partial += 1
        secret_copy[secret_copy.index(char)] = nil
      end
    end

    [exact, partial]
  end

  def self.normalize_guess(input)
    input.is_a?(String) ? input.upcase.chars : input.map(&:upcase)
  end

end