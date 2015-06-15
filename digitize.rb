def digitize(n)
  arr=[]
  n=n.to_s
  n.scan(/./) { |x| arr.push(x.to_i) }
    
  return arr
end

digitize(123)