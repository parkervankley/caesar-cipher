def caesar_cipher(input, shift)
  return input if input.empty?

  input.codepoints.map.with_index do |codepoint, index|
    upcase = codepoint.between?(65, 90)
    codepoint += 32 if upcase
    if codepoint.between?(97, 122)
      if codepoint + shift < 97
        codepoint = 123 - (97 - (codepoint + shift)).abs
      elsif codepoint + shift > 122
        codepoint = 96 + (122 - (codepoint + shift)).abs
      else
        codepoint = codepoint + shift
      end
    end
    codepoint -= 32 if upcase

    codepoint
  end.pack("U*")
end
