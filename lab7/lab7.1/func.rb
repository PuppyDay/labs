# frozen_string_literal: true

def write_to_file
  f_file = File.new('F.txt')
  g_file = File.new('G.txt', 'w')
  while (line = f_file.gets)
    g_file.puts(line.chomp.reverse)
  end
  f_file.close
  g_file.close
end
