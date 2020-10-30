# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'func'

# :nodoc:
class MyTest < Minitest::Test
  ALPHABET = ('a'..'z').to_a
  def setup
    @arr2 = []
    f = File.new('F.txt', 'w')
    rand(5..10).times do |_i|
      word = ALPHABET.sample(10).join
      f.puts(word)
      @arr2 << word.reverse
    end
    f.close
  end

  def test_first
    write_to_file
    g_file = File.new('G.txt')
    iteration = 0
    while (line = g_file.gets)
      assert_equal(@arr2[iteration], line.chomp)
      iteration += 1
    end
    g_file.close
  end
end
