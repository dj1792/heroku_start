require 'sinatra'
require "active_support/all"
require 'sinatra/activerecord'
require 'json'
require 'rake'
#before do
#	content_type :json
#end
#enable :sessions
configure :development do
  require 'dotenv'
  Dotenv.load
end
get'/' do
	error 401
end
error 401 do
	{ error: "Not allowed"}.to_json
end