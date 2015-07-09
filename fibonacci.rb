def iterative_fib(n, num1=1, num2=1, fib_arr = [1, 1])
  while fib_arr.length < n
    num3=num1+num2
    num1=num2
    num2=num3
    fib_arr << num3
  end
  return fib_arr
end

def recursive_fib(n, num1=1, num2=1, fib_arr = [1, 1])
  return fib_arr if fib_arr.length == n
  num3=num1+num2
  num1=num2
  num2=num3
  fib_arr << num3
  recursive_fib(n, num1, num2, fib_arr)
end

def recursive_fib2(n)
  return 1 if n == 1 || n == 0
  return recursive_fib2(n-1) + recursive_fib2(n-2)
end

fib_iterative = iterative_fib(35)
puts fib_iterative[34]
fib_recursive = recursive_fib(35)
puts fib_recursive[34]
fib_recursive2 = recursive_fib2(34)
puts fib_recursive2

require 'benchmark'
num = 35
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib")  { iterative_fib(num)  }
  x.report("recursive_fib2")  { recursive_fib2(num)  }
end
