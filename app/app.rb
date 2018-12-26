require 'optparse'
require_relative './constants'
require_relative './meeting'

module App
  class << self

    attr_reader :options, :meeting
    
    def start
      parse_options
      build_meeting
      edit_meeting
    end

    def parse_options
      options = {}

      OptionParser.new do |parser|
        parser.banner = 'Usage: app.rb [options]'

        parser.on('-h', '--help', 'Show this help message') do ||
            puts parser
        end

        CLI_OPTIONS.each do |option|
          parser.on(option[:flags][0], option[:flags][1], option[:description]) do |v|
            options[option[:name].to_sym] = v
          end
        end
      end.parse!

      @options = options
    end

    def build_meeting
      unless @options.empty?
        team = @options[:team]
        topic = @options[:topic]
        summary = @options[:summary]
        attendees = @options[:attendees]

        @meeting = Meeting.new(team, topic, summary, attendees)
      end
    end

    def edit_meeting
      @meeting.edit
    end
  end
end

App.start
