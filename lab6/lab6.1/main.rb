# frozen_string_literal: true

require_relative 'func'
eps = [0.001, 0.0001]
2.times do |i|
  result = square(eps[i])
  puts "value with eps=#{eps[i]} =\t" + result[0].to_s + "\tnumber of iterations=\t" + result[1].to_s
end
