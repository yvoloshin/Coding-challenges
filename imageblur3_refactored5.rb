class Image
  def initialize(arr)
    @image=arr
  end
  
  def collect_ones
    @all_ones = []
    @image.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        @all_ones.push([y,x]) if cell == 1
      end
    end
  end
    
  def output_image
    @image.each do |row|
      puts(row.join)
    end
  end
    
  def is_in_bounds?(x, y)
    return false if x < 0
    return false if x >= @image.length
    return false if y < 0
    return false if y >= @image[x].length
    return true
  end

  def tuples_for(n)
    collector = []
    negative = n * -1
    positive = n
    (negative..positive).each do |y|
      (negative..positive).each do |x|
        next if x == 0 && y == 0
        next if y.abs + x.abs > n
        collector << [y,x]
      end
    end
    collector
  end

  def output_image_with_tuples(n)
    collect_ones   
    @all_ones.each do |x,y|
      tuples_for(n).each do |a,b|
        if is_in_bounds?(x+a,y+b)
          @image[x+a][y+b]=1
        end
      end
    end
  end

end #class Image


image = Image.new([
                    [1, 0, 0, 0, 0, 0, 0, 0, 1],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 1, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [0, 0, 0, 0, 0, 0, 0, 0, 0],
                    [1, 0, 0, 0, 0, 0, 0, 0, 1]
])

image.output_image_with_tuples(3)
image.output_image
