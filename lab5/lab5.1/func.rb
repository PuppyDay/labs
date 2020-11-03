# frozen_string_literal: true

# class for function
class Moon
  def foo(par_x, par_z, par_r)
    Math.sin(par_x + Math::PI * par_z) / Math.cos(par_x.to_f / par_r)
  end
end
