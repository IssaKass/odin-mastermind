module Validation
  def valid_length?(chars, expected_length)
    chars.length == expected_length
  end

  def valid_colors?(chars, allowed_colors)
    chars.all? { |char| allowed_colors.include?(char) }
  end

  def valid_guess?(input, allowed_colors, expected_length)
    return false unless input.is_a?(String)

    chars = input.upcase.chars

    valid_length?(chars, expected_length) && valid_colors?(chars, allowed_colors)
  end
end