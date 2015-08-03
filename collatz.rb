def collatz(num)
  n = 2
  length = 1
  longest_length = 1
  longest_n = 2
  while n <= num
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
end

def collatz_with_hash(num)
  n = 2
  length = 1
  longest_length = 1
  longest_n = 2
  cache = {}
  while n <= num
    i = n
    length = 1
    cache[n] = [i]
    puts "n=#{ndef }"
    while i != 1
      i = i%2 == 0 ? i/2 : 3*i + 1
      if cache.key?(i)
        puts "key found #{i}"
        cache[n] += cache[i]
        break
      else
        puts "key not found #{i}"
        cache[n] << i
      end
    end
    if cache[n].length > longest_length
      longest_length = cache[n].length
      longest_n = n
    end
    n += 1
  end
  # puts "longest length = #{longest_length}"
  # puts "input = #{longest_n}"
end

def collatz_with_hash2(num)
  n = 2
  length = 1
  longest_length = 1
  longest_n = 2
  cache = {}
  while n <= num
    i = n
    length = 1
    cache[n] = [i]
    while i != 1
      i = i%2 == 0 ? i/2 : 3*i + 1
      if i < n && i != 1
        cache[n] += cache[i]
        break
      else
        cache[n] << i
      end
    end
    if cache[n].length > longest_length
      longest_length = cache[n].length
      longest_n = n
    end
    n += 1
  end
  #puts "longest length = #{longest_length}"
  #puts "input = #{longest_n}"
end

def collatz_with_hash3_recursion(num)
  require 'pry'
  n = 2
  length = 1
  longest_length = 1
  longest_n = 2
  cache = {}
  while n <= num
    i = n
    length = 1
    cache[n] = [i]
    calculate_sequence(cache, n)
    if cache[n].length > longest_length
      longest_length = cache[n].length
      longest_n = n
    end
    n += 1
  end
  #puts "longest length = #{longest_length}"
  #puts "input = #{longest_n}"
end

def calculate_sequence(cache, n)
  return cache if cache[n].last == 1
    j = cache[n].last
    j = j%2 == 0 ? j/2 : 3*j + 1
    if cache.key?(j)
      cache[n] += cache[j]
    else
      cache[n] << j
    end
  calculate_sequence(cache, n)
end

def collatz_with_hash2_redis(num)
  require "redis"
  redis = Redis.new(:host => 'localhost', :port => 6379)
  redis.flushdb
  n = 2
  length = 1
  longest_length = 1
  longest_n = 2
  while n <= num
    i = n
    length = 1
    redis.rpush(n, i)
    while i != 1
      i = i%2 == 0 ? i/2 : 3*i + 1
      if i < n && i != 1
        cache = redis.lrange(i, 0, -1)
        redis.rpush(n, cache)
        break
      else
        redis.rpush(n, i)
      end
    end
    # if redis.llen(n) > longest_length
    #    longest_length = redis.llen(n)
    #    longest_n = n
    # end
    n += 1
  end
  #puts "longest length = #{longest_length}"
  #puts "input = #{longest_n}"
end

require 'benchmark'
num = 1000
Benchmark.bm do |x|
  x.report("collatz n=1000") { collatz(num) }
  x.report("collatz_with_hash n=1000")  { collatz_with_hash(num)  }
  x.report("collatz_with_hash2 n=1000")  { collatz_with_hash2(num)  }
  x.report("collatz_with_hash3_recursion n=1000")  { collatz_with_hash3_recursion(num)  }
  x.report("collatz_with_hash2_redis n=1000")  { collatz_with_hash2_redis(num)  }
end

num = 10_000
Benchmark.bm do |x|
  x.report("collatz n=10_000") { collatz(num) }
  x.report("collatz_with_hash n=10_000")  { collatz_with_hash(num)  }
  x.report("collatz_with_hash2 n=10_000")  { collatz_with_hash2(num)  }
  x.report("collatz_with_hash3_recursion n=10_000")  { collatz_with_hash2(num) }
  x.report("collatz_with_hash2_redis n=10_000")  { collatz_with_hash2_redis(num)  }
end

num = 100_000
Benchmark.bm do |x|
  x.report("collatz n=100_000") { collatz(num) }
  x.report("collatz_with_hash n=100_000")  { collatz_with_hash(num)  }
  x.report("collatz_with_hash2 n=100_000")  { collatz_with_hash2(num)  }
  x.report("collatz_with_hash3_recursion n=100_000")  { collatz_with_hash2(num) }
  x.report("collatz_with_hash2_redis n=100_000")  { collatz_with_hash2_redis(num)  }
end

num = 1_000_000
Benchmark.bm do |x|
  x.report("collatz n=1_000_000") { collatz(num) }
  x.report("collatz_with_hash2_redis n=1_000_000")  { collatz_with_hash2_redis(num)  }
end
