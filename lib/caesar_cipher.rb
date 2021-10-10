class CaesarCipher
  def string_to_hash(string)
    string_array = string.split("")
    Hash[ string_array.map.with_index {|char, index| [index, char]}]
  end

  def hash_values_to_numbers(hash, alphabet, number_shift)
    hash.map {|index, char| [index, char = alphabet.index(char) - number_shift]}
  end

  def array_numbers_to_chars(hash, alphabet)
    hash.map {|index, char| [index, char = alphabet[char]]}
  end

  def caesar_cipher(string, number_shift)
    lowercase_alphabet = ('a'..'z').to_a
    uppercase_alphabet = ('A'..'Z').to_a
    total_alphabet = lowercase_alphabet + uppercase_alphabet
    input_hash = string_to_hash(string)

    uppercase_hash = input_hash.select {|index, char| uppercase_alphabet.include?(char)}
    lowercase_hash = input_hash.select {|index, char| lowercase_alphabet.include?(char)}
    other_character_hash = input_hash.delete_if {|index, char| total_alphabet.include?(char)}

    uppercase_numbers_array = hash_values_to_numbers(uppercase_hash, uppercase_alphabet, number_shift)
    lowercase_numbers_array = hash_values_to_numbers(lowercase_hash, lowercase_alphabet, number_shift)

    uppercase_modified_hash = Hash[array_numbers_to_chars(uppercase_numbers_array, uppercase_alphabet)]
    lowercase_modified_hash = Hash[array_numbers_to_chars(lowercase_numbers_array, lowercase_alphabet)]

    sorted_combined_hashes = Hash[uppercase_modified_hash.merge(lowercase_modified_hash).merge(other_character_hash).sort]
    p sorted_combined_hashes.values.to_a.join("")
  end
end