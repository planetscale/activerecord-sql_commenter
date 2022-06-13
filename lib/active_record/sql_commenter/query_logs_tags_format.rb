# frozen_string_literal: true

require "active_support/core_ext/module/attribute_accessors_per_thread"
require_relative "query_logs_formatter"

module ActiveRecord
  module SqlCommenter
    module QueryLogsTagsFormat
      def self.included(klass)
        klass.class_eval do
          thread_mattr_accessor(:tags_formatter, instance_accessor: false)

          class << self
            private

            def formatter
              self.tags_formatter ||= QueryLogs::Formatter.new
            end

            undef tag_content
            def tag_content
              context = ActiveSupport::ExecutionContext.to_h

              tags.flat_map { |i| [*i] }.filter_map do |tag|
                key, handler = tag
                handler ||= taggings[key]

                val = if handler.nil?
                        context[key]
                      elsif handler.respond_to?(:call)
                        if handler.arity.zero?
                          handler.call
                        else
                          handler.call(context)
                        end
                      else
                        handler
                      end
                "#{key}#{formatter.key_value_separator}#{formatter.quote_value(val)}" unless val.nil?
              end.join(",")
            end
          end
        end
      end
    end
  end
end
