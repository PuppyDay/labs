# frozen_string_literal: true

def find_integral(steps)
  length = 1 / steps.to_f
  (1..steps).to_a.reduce(0) { |acc, el| acc + Math.sqrt(1 + 3 * el * length) } * length
end

def square
  Enumerator.new do |element|
    steps = 0
    loop do
      steps += 1
      integral = find_integral(steps)
      element << integral
    end
  end
end

def condition(eps)
  square.find { |current_integral| (current_integral - 14.0 / 9).abs <= eps }
end
