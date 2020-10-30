# frozen_string_literal: true

# base class
class String
  def initialize(str = 'default')
    @str = str
  end

  def print_str
    puts @str
  end

  attr_reader :str

  def number_of_vowels
    @str.chars.count { |char| char =~ /[aeiouy]/i }
  end
end

# descendant oString class
class StringAndNumber < String
  def initialize(str = 'default')
    super str
    @size = str.length
  end

  def print_size
    puts @size.to_s
  end

  attr_reader :size
end
