# Define the unique method that removes duplicates
def unique(integers)
  uniq_arr=[]
  idx=0
  if integers==[]
    return []
    end
  while idx<integers.length
    idx2=0
    duplicate=false
    while idx2<uniq_arr.length
      if uniq_arr[idx2]==integers[idx]
        duplicate=true
      end
     idx2+=1
    end
    if duplicate == false
      uniq_arr.push(integers[idx])
    end
    puts duplicate
  idx+=1
  end
return uniq_arr
end

#puts(unique([5, 2, 1, 3]))
#puts(uniq_arr.join(',').to_s)
puts(unique([1, 5, 2, 0, 2, -3, 1, 10]).join(',').to_s)
#puts(uniq_arr.join(',').to_s)
