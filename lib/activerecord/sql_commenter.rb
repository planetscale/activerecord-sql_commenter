# frozen_string_literal: true

require_relative "sql_commenter/version"
require_relative "../lib/core_extensions/active_record/query_logs_tags_format"

module Activerecord
  module SqlCommenter
    ActiveRecord::QueryLogs.include(CoreExtensions::ActiveRecord::QueryLogsTagsFormat)
  end
end
