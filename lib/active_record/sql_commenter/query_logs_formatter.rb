# frozen_string_literal: true

module ActiveRecord
  module SqlCommenter
    module QueryLogs
      class Formatter
        attr_reader :key_value_separator

        def initialize
          @key_value_separator = "="
        end

        # @param [string] value
        # @return [String] The formatted value that will be used in our key-value
        # pairs.
        def quote_value(value)
          "'#{value.gsub("'", "\\\\'")}'"
        end
      end
    end
  end
end
