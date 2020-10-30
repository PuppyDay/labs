# frozen_string_literal: true

require_relative 'func'

default_object = StringAndNumber.new('It is the very cool string!')
puts "We have a string: #{default_object.str}, it length: #{default_object.size}"
puts "Number of vowels in string: #{default_object.number_of_vowels}"
