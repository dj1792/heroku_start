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

require_relative './models/link'

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

  if use_table(body).nil?
  	message = "Not valid, try who, why, what or where"  
  else
 	 message = use_table (body)
  end
  
  session["counter"] += 1
  
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message message
  end

  content_type 'text/xml'

  twiml.text

end

#returns the overall most popular media items from Instagram
#http://www.rubydoc.info/gems/instagram/1.1.6--> reference
get "/instagram" do
  Instagram.configure do |config|
  config.client_id = ENV["insta_id"]
  config.client_secret = ENV["insta_secret"]
  end
  
  Instagram.authorize_url

  response = Instagram.get_access_token(params[:code],)
  session[:access_token] = response.access_token

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

#using function to return matching message to input from user
def use_table a
	l = Link.where(placeholder: a)
	return l.msg
end