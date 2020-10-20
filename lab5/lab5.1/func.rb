# frozen_string_literal: true

class Moon
  def foo(par_x, par_z, par_r)
    Math.sin(par_x + Math::PI * par_z) / Math.cos(par_x / par_r)
  end
end

b