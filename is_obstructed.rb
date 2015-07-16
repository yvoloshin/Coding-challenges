# Function accepts location of piece 1, desired new location (destination) of piece 1,
# and location of piece 2. Returns true if the path between piece 1 and destination
# is a straight line and is obstructed by piece 2.
# Locations are shown using x/y 0-7 notation.

def is_obstructed?(piece1_loc, destination, piece2_loc=nil)
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
    slope_piece2 = piece2_loc.nil? ? 0 : (y3-y1)/(x3-x1)
  end
# Checks whether the piece 2 is between piece 1 and the destination, 
# depending on whether the line between piece 1 and destination is horizontal, vertical, or diagonal.
# If it is neither, then the method returns false. 
	if horizontal && x3.between?(x1+1, x2-1)
		return true
	elsif horizontal && x3.between?(x2+1, x1-1)
		return true
	elsif vertical && y3.between?(y1+1, y2-1)
		return true
	elsif vertical && y3.between?(y2+1, y1-1)
		return true
	elsif horizontal || vertical
		return false
	elsif (slope_dest.abs == 1.0) && (slope_piece2.abs == 1) && x3.between?(x1+1, x2-1)
		return true
	elsif (slope_dest.abs == 1.0) && (slope_piece2.abs == 1) && x3.between?(x2+1, x1-1)
		return true
	# return exception instead of string
	elsif (slope_dest.abs != 1.0)
		fail 'not straight line'
	else return false
	end
	
end
