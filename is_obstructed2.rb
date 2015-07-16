# Function accepts location of piece 1, desired new location (destination) of piece 1,
# and location of piece 2. Returns true if the path between piece 1 and destination
# is a straight line and is obstructed by piece 2.
# Locations are shown using x/y 0-7 notation.

def is_obstructed?(piece1_loc, destination)
# converts the location arrays into easier-to-read x and y terms
  x1 = piece1_loc[0]
  y1 = piece1_loc[1]
  x2 = destination[0]
  y2 = destination[1]
  if piece2_loc != nil
    x3 = piece2_loc[0]
    y3 = piece2_loc[1]
  end
  # Determines whether the line between piece 1 and the destination is horizontal or vertical. 
  # If neither, then it calculates the slope of line between piece 1 and destination. 
  # If a second piece is given, then it also calculates the slope between piece 1 and piece 2.
  if y1 == y2
    horizontal = true
  elsif x1 == x2
    vertical = true
  else
    slope_dest = (y2-y1).to_f/(x2-x1).to_f
  end

	if horizontal && x1 < x2
		(x1+1..x2-1).each do |x|
			return true if is_occupied?(x, y1)
		end
	elsif horizontal && x1 > x2
		(x2+1..x1-1).each do |x|
			return true if is_occupied?(x, y1)
		end
	elsif vertical && y1 < y2
		(y1+1..y2-1).each do |y|
			return true if is_occupied?(x1, y)
		end
	elsif vertical && y1 > y2
		(y2+1..y1-1).each do |y|
			return true if is_occupied?(x1, y)
		end
	elsif horizontal || vertical
		return false
	elsif slope_dest.abs == 1.0 && x1 < x2
		(x1+1..x2-1).each do |x|
			delta_y = x-x1
			y = y2 > y1 ? y1 + delta_y : y1 - delta_y
			return true if is_occupied?(x, y)
		end
	elsif slope_dest.abs == 1.0 && x1 > x2
		(x2+1, x1-1).each do |x|
			delta_y = x1-x
			y = y2 > y1 ? y1 + delta_y : y1 - delta_y
			return true if is_occupied?(x, y)
		end
	elsif (slope_dest.abs != 1.0)
		fail 'path is not a straight line'
	else return false
	end
	
end
