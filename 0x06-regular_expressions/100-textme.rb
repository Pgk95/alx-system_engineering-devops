#!/usr/bin/env ruby

message = ARGV[0]

sender_match = message.match(/From: ([^\n]+)/)
receiver_match = message.match(/To: ([^\n]+)/)
flags_match = message.match(/Flags: ([^\n]+)/)

if sender_match && receiver_match && flags_match
  sender = sender_match[1]
  receiver = receiver_match[1]
  flags = flags_match[1]

  puts "#{sender},#{receiver},#{flags}"
else
  puts "Error: could not extract all required fields from message."
end
