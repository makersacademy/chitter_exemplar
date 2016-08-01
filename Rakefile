require 'data_mapper'
require_relative './app/app'

task :auto_upgrade do
  desc 'Auto-upgrade (no data loss)'
  DataMapper.auto_upgrade!
  puts 'Auto-upgrade complete (no data loss)'
end

task :auto_migrate do
  desc 'Auto-migrate (possible data loss)'
  DataMapper.auto_migrate!
  puts 'Auto-migrate complete (all data was lost)'
end
