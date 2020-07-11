require 'bundler'
require 'require_all'

Bundler.require
#require 'require_all'


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.sqlite3')
ActiveRecord::Base.logger = nil

<<<<<<< HEAD
# ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.logger = nil

=======
>>>>>>> f44be06c12054fe2ce2f9c07e2f68b5c94e47560

require_all 'lib'
require_all 'app'
