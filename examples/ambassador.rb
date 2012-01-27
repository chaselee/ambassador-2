require File.dirname(__FILE__) + '/../lib/ambassador'
require 'pp'

#Provide your Ambassador account details
username = 'sample'
api_key = 'v89df89cv890dsf80e80gg890d8w0wfjj'

#Choose whether you want responses in XML or JSON
response_type = 'json'

#Create the Ambassador connection
ambassador = Ambassador.new(username, api_key, response_type)

#Compose your request
params = {
  :campaign_uid => 87, #required, your campaign's ID
  :email => 'joe@gmail.com', #required, your customer's email address
  :short_code => 'aE', #option, referrer's "mbsy" shortcode
  :revenue => 0, #option, revenue amount of the event
  :transaction_uid => 12345, #option, unique transaction ID for the event
  :ip_address => '127.0.0.1', #option, customer's IP address
  :uid => 'i8dNe2', #option, your customer's internal unique ID
  :first_name => 'Joe', #option, your customer's first name
  :last_name => 'Schmoe', #option, your customer's last name
  :email_new_ambassador => 1, #optional, email login credentials to new ambassadors (1 - yes, 0 - no)
  :deactivate_new_ambassador => 0, #optional, new ambassadors created are deactivated (1 - yes, 0 - no)
}


ambassador.record_event(params)
#puts forecast.day_of_week, forecast.low, forecast.high, forecast.condition