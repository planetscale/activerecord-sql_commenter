# frozen_string_literal: true

require_relative "../lib/sql_commenter"

require "minitest/autorun"
require "active_record"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: ":memory:"
)

class SqlCommenterTest < Minitest::Test
  def test_comment
    ActiveRecord::QueryLogs.tags = [test_value: -> { "test" }]
    assert_equal "/*test_value='test'*/", ActiveRecord::QueryLogs.call("")
  end

  def test_escapes_values
    ActiveRecord::QueryLogs.tags = [test_value: -> { "'test'" }]
    assert_equal "/*test_value='\\'test\\''*/", ActiveRecord::QueryLogs.call("")
  end
end
