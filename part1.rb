#HW 1-1: Fun with strings

@debug = false
@testing = false

# Part A — Palindromes
def palindrome?(str)
  only_chars = str.gsub(/[\W]/, '').downcase
  return only_chars == only_chars.reverse
end

# Part B — Word Count
# str.downcase.split(/[\b\W]/).reject{|e| e.empty?}.each
# or better str.downcase.split(/[\b\W]/).compact.each
# to remove empty elements
def count_words(str)
  counter = Hash.new
  str.downcase.split(/[\b\W]/).each do |word|
    if !word.empty?
    if counter.has_key?(word)
    counter[word] = counter[word] + 1
    else
    counter[word] = 1
    end
    end
  end
  return counter
end

if @testing
puts palindrome?("A man, a plan, a canal -- Panama")
puts palindrome?("Madam, I'm Adam!")
puts palindrome?("Abracadabra")
end


