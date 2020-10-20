# frozen_string_literal: true

require_relative 'func'

puts 'Введите x:'
x = gets.to_f
puts 'Введите z:'
z = gets.to_f
puts 'Введите r:'
r = gets.to_f

puts "y=#{Moon.new.foo x, z, r}"
