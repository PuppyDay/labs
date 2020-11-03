# frozen_string_literal: true

require_relative 'func'
array = Array[]
puts 'Введите слово-заменитель'
key = gets.chomp
puts 'Введите строку или -'
while (str = gets.chomp) != '-'
  array.push(str)
end
puts "\n \tИзначальные строки:"
puts array
puts "\n \tОтформатированные строки:"
(0..array.length - 1).each do |i|
  puts foo(array[i], key)
end
