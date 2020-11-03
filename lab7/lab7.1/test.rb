# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'func'

# class for test
class MyTest < Minitest::Test
  ALPHABET = ('a'..'z').to_a
  def setup
    @arr_result = []
    File.open('F.txt', 'w') do |file|
      rand(5..10).times do |_i|
        word = ALPHABET.sample(10).join
        file.puts(word)
        @arr_result << word.reverse
      end
    end
  end

  def test_first
    write_to_file('F.txt', 'G.txt')
    File.open('G.txt') do |g_file|
      iteration = 0
      while (line = g_file.gets)
        assert_equal(@arr_result[iteration], line.chomp)
        iteration += 1
      end
    end
  end
end
