require 'sinatra'
require "active_support/all"
require 'sinatra/activerecord'
require 'json'
require 'rake'
#before do
#	content_type :json
#end

#enable :sessions

development:
  adapter: sqlite3
  database: db/development.sqlite3
  pool: 5
  timeout: 5000

test:
  adapter: sqlite3
  database: db/test.sqlite3
  pool: 5
  timeout: 5000

production:
  adapter: postgresql
  database: ENV['DATABASE_URL']
  pool: 5
  timeout: 5000

get'/' do
	error 401
end

error 401 do
	{ error: "Not allowed"}.to_json
end

