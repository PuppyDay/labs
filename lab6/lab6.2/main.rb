# frozen_string_literal: true

require_relative 'func'
eps = [0.001, 0.0001]
2.times do |i|
  puts "value with eps=#{eps[i]} =\t" + condition(eps[i]).to_s
end
puts 'Correct answer:  ' + (14.0 / 9).to_s
