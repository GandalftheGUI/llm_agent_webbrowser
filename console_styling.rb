COLOR_CODES = {
  red: 91,
  green: 92,
  yellow: 93,
  blue: 94,
  magenta: 95,
  cyan: 96,
  white: 97
}

def colored_label_string(label, message, color = :green)
  color_code = COLOR_CODES[color] || 97
  "\u001b[#{color_code}m#{label}\u001b[0m: #{message}"
end

def with_spinner(label, message, color = :yellow)
  spinner = %w[| / - \\]
  spinning = true
  thread = Thread.new do
    i = 0
    while spinning
      print "\r#{colored_label_string(label, message, color)} #{spinner[i % spinner.length]}"
      sleep(0.1)
      i += 1
    end
  end
  result = yield
  spinning = false
  thread.join
  print "\r" + (" " * 80) + "\r" # Clear the line
  result
end
