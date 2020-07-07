require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite3')

ActiveRecord::Base.logger = Logger.new(STDOUT)

require_all 'lib'
require_all 'app'