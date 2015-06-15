class Image
	def initialize(arr)
		@image=arr
		
	end


	def collect_ones
		row=0
		@all_ones=[]
		while row<@image.length
			col=0
			while col<@image[row].length
				if @image[row][col]==1
					#add (row, col) to 2-D array with all "1" pixels locations in the form (row, col)
					@all_ones.push([row, col])
				end
				col+=1
			end
		row+=1
		end
		puts("all_ones after insertion: "+@all_ones.inspect)
	end


	def transform_image(n)
		@all_ones.each do |loc|
			# [loc]=[row, col]
			row_length=@image[loc[0]].length

			if loc[1] <= row_length-n-1 #when fits
			  idx_forward=n 
			    else idx_forward=row_length-loc[1]-1 # when does not fit
			end

			if loc[0] > n+1
			  idx_up=n
			    else idx_up=loc[0]
			end

			if loc[1] > n-1
			  idx_back=n
				else idx_back=loc[1]
			end

			if loc[0] < @image.length-n-1
			  idx_down=n
			    else idx_down=@image.length-loc[0]-1
			end
# Qudrant 1
			i=1
			while i<=idx_forward
			  @image[loc[0]][loc[1]+i]=1
			    i+=1
			end
			
			j=1
			while j<=idx_forward
			  i=1
			  while i<=n-j && i<= idx_up
			    @image[loc[0]-i][loc[1]+j]=1
			    i+=1
			  end
			  j+=1
			end
# Quadrant 2
			i=1
			while i<=idx_up
			  @image[loc[0]-i][loc[1]]=1
			    i+=1
			end

			j=1
			while j<=idx_up
			  i=1
			  while i<=n-j && i<=idx_back
			    @image[loc[0]-j][loc[1]-i]=1
			    i+=1
			  end
			  j+=1
			end
# Quadrant 3
			i=1
			while i<=idx_back
			  @image[loc[0]][loc[1]-i]=1
			    i+=1
			end

			j=1
			while j<=idx_back
			  i=1
			  while i<=n-j && i<=idx_down
			    @image[loc[0]+i][loc[1]-j]=1
			    i+=1
			  end
			  j+=1
			end
# Quadrant 4
			i=1
			while i<=idx_down
			  @image[loc[0]+i][loc[1]]=1
			    i+=1
			end

			j=1
			while j<=idx_down
			  i=1
			  while i<=n-j && i<=idx_forward
			    @image[loc[0]+j][loc[1]+i]=1
			    i+=1
			  end
			  j+=1
			end



		end
	end


	def output_image
		@image.each do |row|
			puts(row.join)
		end
		
	end


end

image = Image.new([
  [1, 0, 0, 0, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0]
])
image.collect_ones
image.transform_image(3)
image.output_image
