#!/usr/bin/env ruby

regex = Regexp.new("School")
ARGV.each do |arg|
  matches = arg.scan(regex)
  if matches.length > 0
    puts matches.join
  end
end
