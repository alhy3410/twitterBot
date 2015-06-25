require 'Twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "pDsud13l3oXQ5TkENgnjHMrud"
  config.consumer_secret     = "dTxpPGdddMDvlFcreuIGFAZjP140mjQhOyeaYzCpGJkZeB80VO"
  config.access_token        = "3240289718-ZzgIWikxfxGZnff0pxepdaaIr1HWZ24bTN9CaKf"
  config.access_token_secret = "o9edZOjDldCYKlDmiyTjU7LOqu2jNtZYVHrrld5unBn7p"
end


print "Type the search term you are looking for: "
searchTerm = $stdin.gets.chomp

print "What language would you like to see: "
lang = $stdin.gets.chomp

print "Type the name of the file you want to record to: "
filename = $stdin.gets.chomp

targetFileToWrite = open(filename, 'w')
targetFileToWrite.truncate(0)
#client.update("Second Post to test!") #This will post the tweet with the string

tweetHold = []
client.search(searchTerm, lang: lang).take(1000).each do |tweet|
  # Push all the tweets collected one by one to the default output (command-line, usually)

  tweetHold.push(tweet.text)

end

  uniq = tweetHold.uniq

  uniq.each do |sentence|
    targetFileToWrite.write(sentence)
    targetFileToWrite.write("\n")
    targetFileToWrite.write("\n")
  end


targetFileToWrite.close()

puts "All Tweets Recorded"
