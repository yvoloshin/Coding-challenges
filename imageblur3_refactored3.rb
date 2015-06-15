class Image
  def initialize(arr)
    @image=arr	
  end

	private

def collect_ones
  row=0
  @all_ones=[]
  while row<@image.length
  	col=0
	while col<@image[row].length
	  if @image[row][col]==1
		@all_ones.push([row, col])
	  end
	  col+=1
    end
    row+=1
  end
end

def find_boundaries(loc, n)
  row_length=@image[loc[0]].length
  if loc[1] <= row_length-n-1
    @idx_forward=n 
  else @idx_forward=row_length-loc[1]-1 
  end

  if loc[0] > n+1
    @idx_up=n
  else @idx_up=loc[0]
  end
  
  if loc[1] > n-1
    @idx_back=n
  else @idx_back=loc[1]
  end
  
  if loc[0] < @image.length-n-1
    @idx_down=n
  else @idx_down=@image.length-loc[0]-1
  end

end

def output_image
  @image.each do |row|
  puts(row.join)
  end
end

public

def transform_image(n)
  collect_ones
  @all_ones.each do |loc|
	find_boundaries(loc, n)
	x=loc[0]
	y=loc[1]	
# Qudrant 1
	i=1
	while i<=@idx_forward
	  @image[x][y+i]=1
	  i+=1
	end

	j=1
	while j<=@idx_forward
	  i=1
	  while i<=n-j && i<= @idx_up
	    @image[x-i][y+j]=1
		i+=1
	  end
	  j+=1
	end
# Quadrant 2
	i=1
	while i<=@idx_up
	  @image[x-i][y]=1
	    i+=1
	end

	j=1
	while j<=@idx_up
	  i=1
	  while i<=n-j && i<=@idx_back
	    @image[x-j][y-i]=1
          i+=1
	  end
	  j+=1
	end
# Quadrant 3
	i=1
	while i<=@idx_back
	  @image[x][y-i]=1
	  i+=1
	end

	j=1
	while j<=@idx_back
	  i=1
	  while i<=n-j && i<=@idx_down
	    @image[x+i][y-j]=1
	    i+=1
	  end
	  j+=1
	end
# Quadrant 4
	i=1
	while i<=@idx_down
	  @image[x+i][y]=1
	   i+=1
	end

	j=1
	while j<=@idx_down
	  i=1
	  while i<=n-j && i<=@idx_forward
	    @image[x+j][y+i]=1
	    i+=1
	  end
	  j+=1
	end
  end
output_image
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
  [1, 0, 0, 0, 0, 0, 0, 0, 1]
])

image.transform_image(3)

