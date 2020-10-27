# frozen_string_literal: true

def trap(steps, bottom, top, function = false)
  height = (top - bottom) / steps.to_f
  integral = 0
  (bottom..top - height).step(height) do |cur_pos|
    integral += if function
                  function.call(cur_pos) + function.call(cur_pos + height)
                else
                  yield(cur_pos) + yield(cur_pos + height)
                end
  end
  integral * height / 2.0
end
