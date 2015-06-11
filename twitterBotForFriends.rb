require 'Twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "pDsud13l3oXQ5TkENgnjHMrud"
  config.consumer_secret     = "dTxpPGdddMDvlFcreuIGFAZjP140mjQhOyeaYzCpGJkZeB80VO"
  config.access_token        = "3240289718-ZzgIWikxfxGZnff0pxepdaaIr1HWZ24bTN9CaKf"
  config.access_token_secret = "o9edZOjDldCYKlDmiyTjU7LOqu2jNtZYVHrrld5unBn7p"
end

print "Type the name of the file you want to record to: "
filename = $stdin.gets.chomp

targetFileToWrite = open(filename, 'w')
targetFileToWrite.truncate(0)
# client.update("Second Post to test!") This will post the tweet with the string

friendsList = client.friends

friendsList.each do |friend|
  targetFileToWrite.write(friend)
  targetFileToWrite.write("\n")
end

targetFileToWrite.close()

puts "All Tweets Recorded"
