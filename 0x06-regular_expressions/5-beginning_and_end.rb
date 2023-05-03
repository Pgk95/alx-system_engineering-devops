#!/usr/bin/env ruby

if ARGV[0]
  pattern = /^h\w{1}n$/
  match = pattern.match(ARGV[0])
  if match
    puts match[0]
  end
end
