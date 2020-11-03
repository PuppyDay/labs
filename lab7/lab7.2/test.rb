# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'func'

# class for test
class MyTest < Minitest::Test
  ALPHABET = ('a'..'z').to_a
  def setup
    @word = ALPHABET.sample(10).join
    @vowels = @word.chars.count { |vowels| vowels =~ /[aeiouy]/i }
  end

  def test_first
    assert_equal(StringAndNumber.superclass, String)
  end

  def test_second
    refute_equal(String.superclass, StringAndNumber)
  end

  def test_third
    test_object = StringAndNumber.new(@word)
    assert_equal(@word, test_object.str)
    assert_equal(10, test_object.size)
    assert_equal(@vowels, test_object.number_of_vowels)
  end
end
