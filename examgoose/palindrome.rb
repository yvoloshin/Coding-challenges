class String
	def palindrome?
		return true if self.length <= 1
		letters_arr = self.gsub(/\s/,'').gsub(/[[:punct:]]/,'').gsub(/_/,'').chars
		reversed_letters = ''
		letters_arr.each do |character|
			reversed_letters = character + reversed_letters
		end
		return true if letters_arr.join == reversed_letters
		false
	end

end
