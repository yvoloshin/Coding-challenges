class Image
	def initialize(arr)
		@image=arr
		
	end


	def collect_Ones
		row=0
		current_One=[]
		all_Ones=[]
		while row<@image.length
			col=0
			while col<@image[row].length
				if @image[row][col]==1
					#add (row, col) to 2-D array with all "1" pixels locations in the form (row, col)
					current_One.push(row)
					current_One.push(col)
					puts("current_One: "+current_One.inspect)
					puts("all_Ones before insertion: "+all_Ones.inspect)
					all_Ones.push(current_One)
					puts("all_ones after insertion: "+all_Ones.inspect)
					current_One.clear
# current_One keeps its name and identity after being inserted into all_Ones. When new values are added
# to current_One, values in current_One that has been inserted into all_Ones are also changed to be the new values. 
				end
				col+=1
				puts("all_ones after incrementing column: "+all_Ones.inspect)
			end
		row+=1
		puts("all_ones after incrementing row: "+all_Ones.inspect)
		end
		
	end


end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.collect_Ones
