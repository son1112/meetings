# Action
class Action
  attr_reader :detail, :expect_by

  # detail - text
  # expect_by - DateTime
  def initialize(detail, expect_by)
    @detail = detail
    @expect_by = expect_by
  end
end
