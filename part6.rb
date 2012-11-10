# HW 1-6: Advanced OOP, Metaprogramming, Open Classes and Duck Typing 

@debug = false
@testing = false

# Part A — Currency conversion (ELLS 3.11)
class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  def in(currency)
    singular_currency = currency.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      super
    end
  end
end

# Part B — Palindromes
class String
  def palindrome?
    only_chars = self.gsub(/[\W]/, '').downcase
    return only_chars == only_chars.reverse
  end
end

# Part C — Palindromes again
module Enumerable
  def palindrome?
    if self.respond_to?(:reverse)
      return self == self.reverse
    else
      return false
    end
  end
end

if @testing
puts "currency"
puts 5.dollars
puts 5.dollars.in(:euros)
puts 10.euros
puts 10.euros.in(:rupees)
puts 5.rupees
puts 5.rupees.in(:dollar)
puts 5.rupees.in(:yen)
puts "Palindromes"
puts "foo".palindrome?
puts "Madam".palindrome?
puts "Palindromes again"
puts [1,2,3,2,1].palindrome?
puts [1,3,3,2,1].palindrome?
puts ["hello" => "world"].palindrome?
puts (1..3).palindrome?

end


