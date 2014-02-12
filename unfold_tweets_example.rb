#!/usr/bin/env ruby
# encoding: utf-8
# TweetMemeUnfolder / http://github.com/FiXato/TweetMemeUnfolder
# © 2013 by Filip H.F. "FiXato" Slagter / http://profile.fixato.org/
# This code is licensed under the MIT license. See the LICENSE file for details.
# 
# Example usage:
#   unfold the sample tweet at https://twitter.com/charliesome/status/433472351343112192: `unfold_tweets_example.rb`
#   unfold multiple URLs: `unfold_tweets_example.rb URL1 URL2 ... URLn`
#
# Warning: you are subject to rate limiting. I'm not liable for exceeding your rates.
require_relative 'lib/tweet_meme_unfolder'

if ARGV.size > 0
  urls = ARGV
else
  urls = ['https://twitter.com/charliesome/status/433472351343112192']
end

tmu = TweetMemeUnfolder.new('~/.tweet_meme_unfolder-apikeys.yaml')
urls.each do |url|
  unless url =~ TweetMemeUnfolder::STATUS_URL_REGEX
    puts "URL #{url} does not look like a Twitter status URL"
    next
  end
  puts "Will try to expand tweet at #{url} till we find the source of the tweet link meme:"
  puts '-'*78
  tmu.unfold_and_format_tweets_for_url(url)
  puts tmu.formatted_tweets.join("\n")
  puts
  tmu.reset_tweets
end