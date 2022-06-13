# ActiveRecord SqlCommenter

Transform your Rail's query comments into [SqlCommenter](https://google.github.io/sqlcommenter/) format.

SqlCommenter is compatible with [PlanetScale's Query Insights](https://docs.planetscale.com/concepts/query-insights).

**Before:**
```sql
select * from users /*application:'apibb',controller:'database_info',action:'show'*/
```

**After:**
```sql
select * from users /*application='apibb',controller='database_info',action='show'*/
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-sql_commenter', require: "active_record/sql_commenter"
```

And then execute:

    $ bundle install

## Enabling Query Log Tags
In your Rails application, add the following to `config/application.rb`.

```ruby
config.active_record.query_log_tags_enabled = true
```

You can define which tags are added to queries.

```ruby
config.active_record.query_log_tags = [ :application, :controller, :action, :job ]
```

Tags can also be cached per request or job execution.

```ruby
config.active_record.cache_query_log_tags = true
```

To learn more, see the [full documentation here](https://api.rubyonrails.org/classes/ActiveRecord/QueryLogs.html).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/planetscale/activerecord-sql_commenter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/mscoutermarsh/activerecord-sql_commenter/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ActiveRecord::SqlCommenter project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mscoutermarsh/activerecord-sql_commenter/blob/main/CODE_OF_CONDUCT.md).
