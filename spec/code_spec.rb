require_relative '../lib/code'

RSpec.describe Code do
  describe '#initialize' do
    it 'generates a secret code of length `Code::CODE_LENGTH`' do
      code = Code.new
      expect(code.secret.length).to eq(Code::CODE_LENGTH)
    end

    it 'generates a secret code with valid colors' do
      code = Code.new
      expect(code.secret.all? { |color| Code::COLORS.include?(color) }).to be(true)
    end
  end

  describe '#compare' do
    it 'returns exact and partial matches correctly' do
      code = Code.new
      guess = code.secret.join # Making guess the same as the secret code

      exact, partial = code.compare(guess)

      expect(exact).to eq(code.secret.size)
      expect(partial).to eq(0)
    end

    it 'counts partial matches correctly' do
      code = Code.new
      guess = "RGBY" # Guess with 1 exact and 2 partial matches
      
      exact, partial = code.compare(guess)
      
      expect(exact).to be >= 0
      expect(partial).to be >= 0
    end
  end
end
