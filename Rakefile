# frozen_string_literal: true

# original - https://gist.github.com/kalmbach/4471560

require 'dotenv/load'

namespace :db do
  require 'sequel'
  Sequel.extension :migration
  pp ENV['DATABASE_URL']
  DB = Sequel.connect(ENV['DATABASE_URL'])

  desc 'Prints current schema version'
  task :version do
    version = (DB[:schema_info].first[:version] if DB.tables.include?(:schema_info)) || 0

    puts "Schema Version: #{version}"
  end

  desc 'Perform migration up to latest migration available'
  task :migrate do
    Sequel::Migrator.run(DB, 'db/migrations')
    Rake::Task['db:version'].execute
  end

  desc 'Perform rollback to specified target or full rollback as default'
  task :rollback, :target do |_t, args|
    args.with_defaults(target: 0)

    Sequel::Migrator.run(DB, 'db/migrations', target: args[:target].to_i)
    Rake::Task['db:version'].execute
  end

  desc 'Perform migration reset (full rollback and migration)'
  task :reset do
    Sequel::Migrator.run(DB, 'db/migrations', target: 0)
    Sequel::Migrator.run(DB, 'db/migrations')
    Rake::Task['db:version'].execute
  end
end
