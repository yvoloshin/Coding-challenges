class Image
	def initialize(arr)
		@image=arr
		
	end


	def collect_Ones
		row=0
		@all_Ones=[]
		while row<@image.length
			col=0
			while col<@image[row].length
				if @image[row][col]==1
					#add (row, col) to 2-D array with all "1" pixels locations in the form (row, col)
					@all_Ones.push([row, col])
				end
				col+=1
			end
		row+=1
		end
		puts("all_Ones after insertion: "+@all_Ones.inspect)
	end

	def transform_image
		@all_Ones.each do |loc|
			# [loc]=[row, col]
			#if loc[1]<(@image[loc[0]].length-1)
				@image[loc[0]][loc[1]+1]=1
			#elsif loc[1]>0
				@image[loc[0]][loc[1]-1]=1
			#elsif loc[0]<(@image[loc[0]].length-1)
				@image[loc[0]+1][loc[1]]=1
			#elsif loc[0]>0
				@image[loc[0]-1][loc[1]]=1
			#end
		end
	end


	def output_image
		@image.each do |row|
			puts(row.join)
		end
		
	end


end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image.collect_Ones
image.transform_image
image.output_image
