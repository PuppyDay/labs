# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'func'

# class for test
class MyTest < Minitest::Test
  def test_first
    assert_in_delta(1, Moon.new.foo(0, 0.5, 1), 0.0001)
  end

  def test_second
    assert_in_delta(-1.732, Moon.new.foo(Math::PI / 3, 1, 1), 0.0001)
  end
end
