# Note
class Note
  attr_reader :actions

  # summary - text
  # actions - Array[Action]
  # category - Symbol
  def initialize(summary, actions, category)
    @summary = summary
    @actions = actions
    @category = category
  end
end
