require 'minitest/autorun'

module Luhn
	def self.is_valid?(number)
		arr=[]
		number.to_s.split(//).each_with_index do |value,index|
			if index%2 == 0
				value = (value.to_i * 2) >= 10 ? (value.to_i * 2-9) : value.to_i * 2
			else
				value = value.to_i
			end
			arr << value
		end
		result = arr.inject { |result, element| result + element }
		result%10 == 0 ? true : false
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