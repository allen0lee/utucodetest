require 'pg'
require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'utu_code_test'
}

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || options)