# frozen_string_literal: true

def foo(str, key)
  help = str.split(' ')
  help.map.with_index do |el, iter|
    if iter.odd? && (el[0] == 'н')
      key
    elsif iter.even? && (el[0] == 'л')
      nil
    else
      el
    end
  end.compact.join(' ')
end
