module Utilities
  module Cli
    module Prompt
      # Array[Hash]
      def ask(queries = {})
        puts 'Type (:action, :comment, :important):'
        type = 'foo'

        puts 'Summary:'
        summary = gets.chomp

        puts 'Expected by:'
        expect_by = gets.chomp

        puts expect_by

        self.add_note(type, summary, expect_by)

        # queries.each
      end
    end
  end
end
end
