def is_anagram_hash(string1, string2)
  arr1 = get_letters_no_space(string1)
  arr2 = get_letters_no_space(string2)
  return false if arr1.length != arr2.length
  counts = Hash.new 0
  # counts = Hash.new
  # ('a'..'z').each {|letter| counts[letter] = 0}
  arr1.each do |letter|
    counts[letter] += 1
  end
  arr2.each do |letter|
    counts[letter] -= 1
  end
  counts.values.each do |value|
    return false if value != 0
  end
  return true
end

def is_anagram_sort(string1, string2)
  arr1 = get_letters_no_space(string1)
  arr2 = get_letters_no_space(string2)
  return false if arr1.length != arr2.length
  arr1.sort == arr2.sort
end

def get_letters_with_space(string)
  string.downcase.split(//)
end

def get_letters_no_space(string)
  string.gsub(/\s+/, "").downcase.split(//)
end

# puts is_anagram_hash('anagram', 'nag a ram')
# puts is_anagram_hash('anagram', 'nag a rum')
# puts is_anagram_sort('anagram', 'nag a ram')
# puts is_anagram_sort('anagram', 'nag a rum')

require 'benchmark'
Benchmark.bm do |x|
  x.report("is_anagram sorted") { is_anagram_sort('anagram anagram anagram anagram anagram anagram anagram anagram anagram anagram anagram anagram anagram anagram', 'nag a ram nag a ram nag a ram nag a ram nag a ram nag a ram nag a ram nag a ram nag a ram nag a ram nag a ram nag a ram nag a ram nag a ram') }
  x.report("is_anagram_hash")  { is_anagram_hash('anagram anagram anagram anagram anagram anagram anagram anagram anagram anagram anagram anagram anagram anagram', 'nag a ram nag a ram nag a ram nag a ram nag a ram nag a ram nag a ram nag a ram nag a ram nag a ram nag a ram nag a ram nag a ram nag a ram')  }
end
