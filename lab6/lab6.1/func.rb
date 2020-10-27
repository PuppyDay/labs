# frozen_string_literal: true

def find_integral(steps)
  length = 1 / steps.to_f
  (1..steps).to_a.reduce(0) { |acc, el| acc + Math.sqrt(1 + 3 * el * length) } * length
end

def square(eps)
  steps = 0
  integral = 0
  loop do
    steps += 1
    integral = find_integral(steps)
    break if (integral - 14.0 / 9).abs <= eps
  end
  [integral, steps]
end
