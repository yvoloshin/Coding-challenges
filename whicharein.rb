def in_array(array1, array2)
  sorted_arr=[]
  array1.each do |substring|
  	array2.each do |word|
  		if sorted_arr.include?(substring)==false
  		  word.scan(/#{substring}/) {|x| sorted_arr.push(x)}
  		end
  	end
  end
  sorted_arr.sort
end


a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
puts(in_array(a1, a2).inspect)
a1 = ["tarp", "mice", "bull"]
puts(in_array(a1, a2).inspect)
