require "option_parser"
require "./xkcd_client"


save = false
number = Xkcd_Client::LATEST_COMIC

OptionParser.parse do |parser|
  parser.banner = "Usage: xkcd-grabber [arguments]"
  parser.on("-n", "--number", "comic number to download") { |n| number = n.to_i }
  parser.on("-s", "--save", "save the comic to local disk") { save = true }
  parser.on("-h", "--help", "Show this help") { puts parser }
end

client=Xkcd_Client.new number

puts "Comic info:"
puts "Date:  #{client.date}"
puts "Title: #{client.safe_title}"
puts "Alt:   #{client.alt}"
if save 
  fname=client.saveToDisk
  puts "saved to disk: #{fname}"
end

