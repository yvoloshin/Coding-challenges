def collatz
  n = 2
  length = 1
  longest_length = 1
  longest_n = 2
  while n <= 1000000
    i = n
    length = 1
    while i != 1
      i = i%2 == 0 ? i/2 : 3*i + 1
      length += 1
      if i == 1 && length > longest_length
        longest_length = length
        longest_n = n
      end
    end
    n += 1
  end
  puts "longest length = #{longest_length}"
  puts "input = #{longest_n}"
end

collatz
