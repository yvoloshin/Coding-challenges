require 'minitest/autorun'

module Luhn
	def self.is_valid?(number)
		arr = number.to_s.split(//)
		puts arr.inspect
		sum = arr.inject({}) do |result, element|
			if (result.to_i)%2 == 0
				result = (result.to_i * 2) >= 10 ? (result.to_i * 2-9) : result.to_i * 2
			else
				result = result.to_i
			end
		 	result + element.to_i
		end
		puts sum

		
		#result%10 == 0 ? true : false
	end
end

Luhn.is_valid?(4194560385008504)

class TestLuhn < MiniTest::Unit::TestCase

	def test_luhn_valid
		assert Luhn.is_valid?(4194560385008504)
	end

	def test_luhn_invalid
		assert ! Luhn.is_valid?(4194560385008505)
	end

end