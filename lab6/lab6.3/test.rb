# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/assertions'
require_relative 'func'

# class for test
class MyTest < Minitest::Test
  def test_first
    assert_in_delta(Math.sin(4) + Math.sin(1) + 15.0 / 2,
                    trap(100, -1, 4) { |x_param| x_param + Math.cos(x_param) }, 0.1)
  end

  def test_second
    assert_in_delta((Math.cos(3) + 17) * 0.5, trap(100, 0, 3) { |x_param| 2 * x_param - 0.5 * Math.sin(x_param) }, 0.1)
  end
end
