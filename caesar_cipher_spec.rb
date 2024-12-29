require_relative 'caesar_cipher'

RSpec.describe '#caesar_cipher' do
  it 'shifts letters correctly for positive shift values' do
    result = caesar_cipher("a string", 5)
    expect(result).to eq("f xywnsl")
  end

  it 'handles negative shift values correctly' do
    result = caesar_cipher("f xywnsl", -5)
    expect(result).to eq("a string")
  end

  it 'wraps from z to a correctly' do
    result = caesar_cipher("xyz", 3)
    expect(result).to eq("abc")
  end

  it 'wraps from a to z correctly' do
    result = caesar_cipher("abc", -3)
    expect(result).to eq("xyz")
  end

  it 'maintains case for uppercase and lowercase letters' do
    result = caesar_cipher("Hello World", 3)
    expect(result).to eq("Khoor Zruog")
  end

  it 'does not shift non-alphabetic characters' do
    result = caesar_cipher("123!@#", 4)
    expect(result).to eq("123!@#")
  end

  it 'handles large shift values by wrapping around the alphabet' do
    result = caesar_cipher("abc", 29) # Equivalent to shift of 3
    expect(result).to eq("def")
  end

  it 'returns an empty string when the input is empty' do
    result = caesar_cipher("", 5)
    expect(result).to eq("")
  end
end
