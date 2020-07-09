require 'bundler'
Bundler.require
#require 'require_all'


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite3')

# ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.logger = nil


require_all 'lib'
require_all 'app'