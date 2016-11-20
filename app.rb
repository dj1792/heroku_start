require 'sinatra'
require "active_support/all"
require 'sinatra/activerecord'
require 'json'
require 'rake'

#before do
#	content_type :json
#end

require 'twilio-ruby'
require 'instagram'

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

get '/incoming_sms' do

  session["counter"] ||= 0
  count = session["counter"]
  
  sender = params[:From] || ""
  body = params[:Body] || ""
  body = body.downcase.strip

  if session["counter"] < 1
    message = "Thanks for your first message. From #{sender} saying #{body}"
  else
    message = "Thanks for message number #{ count }. From #{sender} saying #{body}"
  end
  
  session["counter"] += 1
  
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message message
  end

  content_type 'text/xml'

  twiml.text

end

#returns the overall most popular media items from Instagram
get '/insta' do
   
  Instagram.configure do |config|
  config.client_id = ENV["insta_id"]
  config.client_secret = ENV["insta_secret"]
  end

  client = Instagram.client(:access_token => session[:access_token])
 
  results = client.media_popular(limit:3)
  message = "Most popular image on Instagram"
  pic = results.first.media_item.images.thumbnail.url
    
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message do |m|
        m.Body message
        unless pic.nil?
            m.Media pic
        end
    end
  end
  twiml.text
 
end

get'/' do
	error 401
end

error 401 do
	{ error: "Not allowed"}.to_json
end