# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'func'

# :nodoc:
class MyTest < Minitest::Test
  ALPHABET = ('a'..'z').to_a
  def setup
    arr1 = []
    arr2 = []
    rand(5..10).times do |i|
      # puts i
      word = ALPHABET.sample(10).join
      a = rand(0..2)
      puts 'a=  ' + a.to_s
      case a
      when 0
        puts 'i=  ' + i.to_s
        if i.odd?
          arr1 << 'н' + word
          arr2 << 'key'
        else
          arr1 << word
          arr2 << word
        end
      when 1
        puts 'ii=  ' + i.to_s
        if i.even?
          arr1 << 'л' + word
          arr2 << nil
        else
          arr1 << word
          arr2 << word
        end

      when 2
        puts 'iii=  ' + i.to_s
        arr1 << word
        arr2 << word
      end
    end
    puts @str = arr1.join(' ')
    puts 'iiiiiiiiiiiiiiiiiiiiiiiii'
    puts @rez = arr2.compact.join(' ')
    puts 'jjjjjjjj'
  end

  def test_first
    assert_equal(@rez, foo(@str, 'key'))
  end

  def test_second
    assert_equal(@rez, foo(@str, 'key'))
  end
end
