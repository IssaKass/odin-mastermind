require_relative '../lib/validation'

RSpec.describe Validation do
  include Validation

  describe '#valid_guess?' do
    it 'returns false for invalid guess length' do
      expect(valid_guess?("RGB", Code::COLORS, Code::CODE_LENGTH)).to be(false)
    end

    it 'returns false for invalid colors' do
      expect(valid_guess?("RGXZ", Code::COLORS, Code::CODE_LENGTH)).to be(false)
    end

    it 'returns true for a valid guess' do
      expect(valid_guess?("RGBY", Code::COLORS, Code::CODE_LENGTH)).to be(true)
    end
  end
end
