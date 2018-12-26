# Org
module Org
  def publish
    open(org_file, 'a') { |file|
      file.write org_text
    }
    puts "meeting published to #{org_file}"
  end

  def org_file
    output_path = File.expand_path('output', __dir__)
    datetime = "#{Time.now.to_s.gsub(' ', '-')}"
    filepath = "#{output_path}/#{team}-#{topic}-#{datetime}.org"

    if !File.exist?(filepath)
      file = File.open(filepath, 'w')
      file.write('')
      file.close
    end

    filepath
  end

  def org_text
  <<-TEXT
    #{org_header}

    #{org_notes}
    TEXT
  end

  def org_header
    <<-TEXT
    *#{topic.capitalize}* (#{team})

    #{summary.capitalize}
    TEXT
  end

  def org_notes
    <<-TEXT
    ** Actions

    #{org_actions}
    TEXT
  end

  def org_actions
    actions.collect { |action|
      "- #{action.detail.capitalize}, Expected by: #{action.expect_by}"
    }.join("\n")
  end
end
