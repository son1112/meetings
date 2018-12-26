# TODO: organize structure
require_relative './note'
require_relative './action'
require_relative './org'

# SMART
# Meeting
class Meeting
  include Org
  include Utilities::Cli::Prompt

  attr_reader :team, :topic, :summary, :attendees, :actions, :notes

  # category - Symbol (:1_on_1, :team, :project)
  # attendees - Array[String]
  def initialize(team, topic, summary, attendees = [])
    @team = team
    @topic = topic
    @summary = summary
    @attendees = attendees
    @actions = []
    @notes = []
  end

  # type - Symbol (:detail, :comment, :action)
  # summary - text
  # expect_by - DateTime (optional)
  def add_note(type, summary, *expect_by)
    case type
    when :action
      @actions << Action.new(summary, expect_by)
    end
    @notes << Note.new(summary, @actions, @topic)
  end

  def edit
    # Query: {
    #   flag: *flags,
    #   type: 
    # }

    while true do
      puts 'Add a NOTE, PUBLISH or QUIT? (N/P/Q)'
      case gets.chomp
      when 'N', 'n'
        prompt.ask(:type, :summary, :expect_by)
      when 'P', 'p'
        self.publish
        break
      when 'Q', 'q'
        break
      else
        break
      end
  end
end

