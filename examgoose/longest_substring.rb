module LongestSubstring

	def self.find(string1, string2)
		return nil if string1.nil? || string2.nil?
		common = []
		string1.chars.each do |char1|
			if string2.chars.include?(char1) && common.include?(char1) == false
				common << char1
			end
		end
		return nil if common.empty?
		return common.join

	end

end
