# frozen_string_literal: true

require "active_support/lazy_load_hooks"
require_relative "sql_commenter/version"
require_relative "sql_commenter/query_logs_tags_format"

ActiveSupport.on_load :active_record do
  ActiveRecord::QueryLogs.include(ActiveRecord::SqlCommenter::QueryLogsTagsFormat)
end
