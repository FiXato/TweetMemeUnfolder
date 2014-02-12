TweetMemeUnfolder
=================

Apparently one of the latest meme trends is to create Tweets that link to other Tweets that (seem to endlessly) link to other Tweets (such as the one at https://twitter.com/charliesome/status/433472351343112192). This little CLI tool tries to retrieve all of them.

# Twitter API
This utility makes use of the `twitter` gem to access the Twitter API. Upon the first run it will create a sample YAML config file in which you should define your Twitter Consumer API-key and -secret. 

See `unfold_tweets_example.rb` for usage examples.
