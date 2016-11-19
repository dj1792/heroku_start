require 'sinatra'
require "active_support/all"
#require 'sinatra/activerecord'
require 'json'
require 'rake'

#before do
#	content_type :json
#end

require 'twilio-ruby'

enable :sessions

configure :development do
  require 'dotenv'
  Dotenv.load
end

client = Twilio::REST::Client.new ENV["Twilio_sid"], ENV["Twilio_token"]

get "/send_sms" do

  client.account.messages.create(
    :from => "+14122183432",
    :to => "+14122947286",
    :body => "Hey there. This is a test"
  )

  "Sent message"
  
end

get'/' do
	error 401
end

error 401 do
	{ error: "Not allowed"}.to_json
end