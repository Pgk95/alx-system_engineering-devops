#!/usr/bin/env ruby

if ARGV[0]
  puts ARGV[0].scan(/hbt{2,1,5}/).join
end
