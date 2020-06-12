require "option_parser"
require "./xkcd_client"

# inspired from
# https://eryb.space/2020/05/27/diving-into-go-by-building-a-cli-application.html

save = false
number = Xkcd_Client::LATEST_COMIC

OptionParser.parse do |parser|
  parser.banner = "Usage: xkcd-grabber [arguments]"
  parser.on("-n NUM", "--number NUM", "comic number to download") { |num| number = num.to_i }
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

