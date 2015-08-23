class String

	def alphabet
		@alphabet_lowcase = Hash.new
		@alphabet_capital = Hash.new
		('a'..'z').to_a.each_with_index do |letter, i|
			@alphabet_lowcase[i] = letter
		end
		('A'..'Z').to_a.each_with_index do |letter, i|
			@alphabet_capital[i] = letter
		end
	end

	def rot13
		alphabet
		new_string_arr = []
		self.split(//).each do |letter|
			if @alphabet_lowcase.has_value?(letter)
				if @alphabet_lowcase.key(letter) <= 12
					new_key = @alphabet_lowcase.key(letter) + 13
				else new_key = @alphabet_lowcase.key(letter) + 13 - 26
				end
				new_letter = @alphabet_lowcase[new_key]
			elsif @alphabet_capital.has_value?(letter)
				if @alphabet_capital.key(letter) <= 12
					new_key = @alphabet_capital.key(letter) + 13
				else new_key = @alphabet_capital.key(letter) + 13 - 26
				end
				new_letter = @alphabet_capital[new_key]
			else new_letter = letter
			end
			new_string_arr << new_letter
		end
		new_string_arr.join
	 end

end
