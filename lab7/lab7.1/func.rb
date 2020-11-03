# frozen_string_literal: true

def write_to_file(f_name, g_name)
  File.open(f_name.to_s) do |f_file|
    File.open(g_name.to_s, 'w') do |g_file|
      while (line = f_file.gets)
        g_file.puts(line.chomp.reverse)
      end
    end
  end
end
