#require 'pry'

@cache = {}

def sequence_for(i)
  #binding.pry
  return [1] if i == 1
  if @cache.key?(i)
    return @cache[i]
  else
    next_i = i % 2 == 0 ? i/2 : i*3+1
    next_sequence = sequence_for(next_i)
    sequence = [i] + next_sequence
    @cache[i] = sequence
    return sequence
  end
end

#puts sequence_for(7).inspect
#puts @cache.inspect

require 'benchmark'
num = 1_000_000
Benchmark.bm do |x|
  x.report("sequence_for n=1_000_000") { sequence_for(num) }
end
