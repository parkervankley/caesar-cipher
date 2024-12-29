def caesar_cipher(input, shift)
  # Return the input immediately if it's an empty string
  return input if input.empty?

  input.codepoints.map.with_index do |codepoint, index|
    # Check if the current character is an uppercase letter (A-Z) using ASCII values
    upcase = codepoint.between?(65, 90)

    # Convert uppercase letters to lowercase for consistent processing
    codepoint += 32 if upcase

    # Process only if the character is a lowercase letter (a-z)
    if codepoint.between?(97, 122)
      if codepoint + shift < 97
        # If the shift moves the character before 'a', wrap around to 'z'
        codepoint = 123 - (97 - (codepoint + shift)).abs
      elsif codepoint + shift > 122
        # If the shift moves the character past 'z', wrap around to 'a'
        codepoint = 96 + (122 - (codepoint + shift)).abs
      else
        # If within the valid range, apply the shift directly
        codepoint += shift
      end
    end

    # Convert the character back to uppercase if it was originally uppercase
    codepoint -= 32 if upcase

    # Return the transformed codepoint
    codepoint
  end.pack("U*") # Convert the array of transformed codepoints back to a string
end
