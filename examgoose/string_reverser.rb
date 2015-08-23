module StringReverser
	def self.reverse(string)
		if string.nil? == false
			str_arr = string.chars
			reversed_string = ''
			str_arr.each do |character|
				reversed_string = character + reversed_string
			end
			return reversed_string
		else return nil
		end
	end

end
