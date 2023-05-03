#!/usr/bin/env ruby

pattern = /[[:upper:]]/
string = ARGV[0]

matches = string.scan(pattern)

puts matches.join
