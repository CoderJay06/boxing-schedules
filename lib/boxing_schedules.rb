#enviornment file
require "nokogiri"
require "open-uri"
require 'pry'
require 'colorize'
require 'colorized_string'

require_relative "boxing-schedules/version"
require_relative "boxing-schedules/cli"
require_relative "boxing-schedules/scraper"
require_relative "boxing-schedules/fight"

module BoxingSchedules
    class Error < StandardError; end
    # Your code goes here...
end
