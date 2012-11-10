# HW 1-3: Anagrams 

@debug = false
@testing = false

def combine_anagrams(words)
  anagram_list = Array.new
  words.each do |w|
    is_new = true
    anagram_list.each do |a|
      if @debug
        printf "l:" + a.length.to_s
        if a.length > 0 ; printf ",e0:" + a[0] ; end
        printf "\n"
      end
      if a[0].chars.sort_by(&:downcase).join.downcase == w.chars.sort_by(&:downcase).join.downcase
        is_new = false
        a << w
      end
    end
    if is_new
      a = Array.new
      a[0] = w
      anagram_list << a
      if @debug ; puts "new:" + w ; end
    end
  end
  return anagram_list
end

if @testing
def print_anagrams(ana)
  puts "-----------"
  ana.each do |elem|
    elem.each do |w| 
      printf w + ","
    end
    printf "\n"
  end
end

ana = combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']); print_anagrams(ana)

ana = combine_anagrams(['A', 'a']); print_anagrams(ana)

ana = combine_anagrams(['HeLLo', 'hello']); print_anagrams(ana)
end

