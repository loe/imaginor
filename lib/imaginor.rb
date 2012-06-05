Bundler.setup

require 'cinch'
require 'yajl'
require 'open-uri'
require 'cgi'
require 'imaginor_plugin'

class Imaginor
  def self.run!(*args)
    @@server = args[0] || ENV['SERVER']
    @@nick = args[1] || ENV['NICK']
    @@channels = args[2..-1] || ENV['CHANNELS'].to_a

    self.new.start
  end

  def initialize
    @bot = Cinch::Bot.new do
      configure do |c|
        c.server = @@server
        c.nick   = @@nick
        c.channels = @@channels
        c.plugins.plugins = [ImaginorPlugin]
      end
    end
  end

  def start
    @bot.start
  end
end
