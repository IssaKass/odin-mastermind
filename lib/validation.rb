module Validation
  def valid_length?(chars, expected_length)
    chars.length == expected_length
  end

  def valid_colors?(chars, allowed_colors)
    chars.all? { |char| allowed_colors.include?(char) }
  end

  def valid_guess?(input, allowed_colors, expected_length)
    chars = Code.normalize_guess(input)

    valid_length?(chars, expected_length) && valid_colors?(chars, allowed_colors)
  end
end