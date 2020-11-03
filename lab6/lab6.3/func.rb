# frozen_string_literal: true

def trap(steps, bottom, top)
  height = (top - bottom) / steps.to_f
  (bottom..top - height).step(height).sum do |cur_pos|
    yield(cur_pos) + yield(cur_pos + height)
  end * height / 2.0
end
