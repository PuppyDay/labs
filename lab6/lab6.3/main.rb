# frozen_string_literal: true

require_relative 'func'
puts 'integral  x + cos(x):  ' + trap(100, -1, 4) { |x| x + Math.cos(x) } .to_s
integral_func = ->(x) { Math.tan(x + 1) / (x + 1) }
puts 'integral  tg(x+1)/(x+1):  ' + trap(100, 0, 2, integral_func) .to_s
