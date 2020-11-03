# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'func'

# :nodoc:
class MyTest < Minitest::Test
  ALPHABET = ('a'..'z').to_a
  def setup
    arr_initial = []
    arr_rez = []
    rand(5..10).times do |i_key|
      word = ALPHABET.sample(10).join
      case rand(0..2)
      when 0
        if i_key.odd?
          arr_initial << 'н' + word
          arr_rez << 'key'
        else
          arr_initial << word
          arr_rez << word
        end
      when 1
        if i_key.even?
          arr_initial << 'л' + word
          arr_rez << nil
        else
          arr_initial << word
          arr_rez << word
        end
      when 2
        arr_initial << word
        arr_rez << word
      end
    end
    @str = arr_initial.join(' ')
    @rez = arr_rez.compact.join(' ')
  end

  def test_first
    assert_equal(@rez, foo(@str, 'key'))
  end

  def test_second
    assert_equal(@rez, foo(@str, 'key'))
  end
end
