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

require 'twilio-ruby'

development:
@client = Twilio::REST::Client.new Twilio_sid, Twilio_token
message = @client.account.messages.create(:body => "Hello from Ruby",
    :to => "+14122947286",    # Replace with your phone number
    :from => "+14122183432")  # Replace with your Twilio number

puts message.sid
end
get'/' do
	error 401
end

error 401 do
	{ error: "Not allowed"}.to_json
end