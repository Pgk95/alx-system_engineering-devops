#!/usr/bin/env ruby

if ARGV[0]
  pattern = /^\d{10}$/
  match = pattern.match(ARGV[0])
  if match
    puts match[0]
  else
    puts
  end
end
