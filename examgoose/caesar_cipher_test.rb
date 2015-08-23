require 'minitest/autorun'
require_relative 'caesar_cipher.rb'

class CaesarCipherTest < Minitest::Test
  def test_empty_string
    assert_equal "", "".rot13
  end

  def test_one_letter_string
    assert_equal "n", "a".rot13
  end

  def test_capital_and_lowercase
    assert_equal "nO", "aB".rot13
  end


  def test_string
    assert_equal "Whyvhf NGGNPX Tnhy Abj", "Julius ATTACK Gaul Now".rot13
  end

  def test_two_transformations_performs_the_same
  	str = "Julius ATTACK Gaul Now"
    assert_equal str, str.rot13.rot13
  end


end
