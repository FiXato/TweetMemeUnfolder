# encoding: utf-8
require 'twitter'
require 'yaml'

class Twitter::Tweet
  def to_irc_format
    "<#{user.screen_name}/#{user.name}> #{text} // #{url}"
  end
  
  def last_expanded_url
    urls.last.expanded_url
  end
end
class TweetMemeUnfolder
  attr_reader :client, :config_path, :config, :unfolded_tweets, :formatted_tweets

  DEFAULT_CONFIG = {
    :consumer_key    => "YOUR_TWITTER_API_KEY",
    :consumer_secret => "YOUR_TWITTER_API_SECRET",
  }
  DEFAULT_CONFIG_PATH = File.expand_path(File.join(__FILE__, '..', '.twitter_api_keys.yaml'))
  STATUS_URL_REGEX = /https?:\/\/twitter.com\/[^\/]+\/status\/(\d+)/

  def initialize(config_path=DEFAULT_CONFIG_PATH)
    @config = DEFAULT_CONFIG
    @config_path = File.expand_path(config_path)
    if File.exist?(@config_path)
      config.merge!(YAML.load_file(@config_path))
    else
      File.open(@config_path, 'w'){|f|f.write(config.to_yaml)}
      raise "Could not find YAML config at #{@config_path}, so a new config file with default values has been created. Please edit in your Twitter API key and secret."
    end
    @client = Twitter::REST::Client.new(config)
    reset_tweets
  end

  def reset_tweets
    @unfolded_tweets = []
    @formatted_tweets = []
  end
  
  def status_id_for_url(url)
    url.to_s.match(STATUS_URL_REGEX)[1]
  end
  
  def unfold_tweets_for_url(url)
    while status_id = status_id_for_url(url)
      break unless tweet = client.status(status_id.to_i)
      @unfolded_tweets << tweet
      url = tweet.urls.last.expanded_url.to_s
      next
    end    
  rescue Twitter::Error::Forbidden => e
    puts "Did you forget to edit your API key and secret at #{config_path}?"
    raise e
  end

  def unfold_and_format_tweets_for_url(url)
    begin
      unfold_tweets_for_url(url)
      @formatted_tweets += unfolded_tweets.map{|t|t.to_irc_format}
    rescue Twitter::Error::NotFound
      @formatted_tweets += unfolded_tweets.map{|t|t.to_irc_format}
      last_tweet = unfolded_tweets.last
      @formatted_tweets << "Tweet at #{last_tweet.last_expanded_url} with status id #{status_id_for_url(last_tweet.last_expanded_url)} that was last referred to in Tweet at #{last_tweet.url} could not be found.\nTweet link meme for #{unfolded_tweets.first.url} ends here."
    end
  end
end