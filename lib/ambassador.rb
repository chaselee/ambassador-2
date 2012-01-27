require 'httparty'

class Ambassador  
  include HTTParty
  
  def initialize(username, api_key, response_type)
    self.class.default_params :username => username, :api_key => api_key, :response_type => response_type
    self.class.base_uri "https://getambassador.com/api/v2/#{username}/#{api_key}/#{response_type}"
  end
  
  # Records an instance of a campaign event
  # :campaign_uid           [required]
  # :email                  [required]
  # :short_code             [required for referred registrations]
  # :revenue
  # :transaction_uid
  # :ip_address
  # :uid
  # :first_name
  # :last_name
  # :email_new_ambassador
  # :deactivate_new_ambassador
  def record_event(params = {})
    self.class.post('/event/record', :query => params)
  end
  
  # Retrieve info for a single ambassador.
  # :email           [required]
  # :uid
  # :first_name
  # :last_name
  # :email_new_ambassador
  # :sandbox
  # :deactivate_new_ambassador
  def ambassador(params = {})
    self.class.post('/ambassador/get', :query => params)
  end
  
  # Retrieves a list of up to 100 ambassadors, optionally filtered by the parameters below.
  # :page
  # :min_money
  # :min_points
  # :min_referrals
  def ambassadors(params = {})
    self.class.post('/ambassador/all', :query => params)
  end
  
  # Deducts from the running commission balance for one of your customers.
  # :email        [required]
  # :amount       [required]
  # :uid
  # :type
  # :email_new_ambassador
  # :sandbox
  # :deactivate_new_ambassador
  def deduct_balance(params = {})
    self.class.post('/balance/deduct', :query => params)
  end
  
  # Adds to the running commission balance of an ambassador.
  # :email        [required]
  # :amount       [required]
  # :uid
  # :type
  # :email_new_ambassador
  # :sandbox
  # :deactivate_new_ambassador
  def add_balance(params = {})
    self.class.post('/balance/add', :query => params)
  end
  
  # Retrieves the referring ambassador and campaign information tied to an “mbsy” shortcode.
  # :short_code        [required]
  # :sandbox
  def add_balance(params = {})
    self.class.post('/shortcode/get', :query => params)
  end
  
  # Retrieves an AddThis snippet for all active campaigns for one of your customers.
  # :email    [required]
  # :uid
  # :first_name
  # :last_name
  # :message
  # :email_new_ambassador
  # :sandbox
  # :deactivate_new_ambassador
  def addthis(params = {})
    self.class.post('/social/addthis', :query => params)
  end
  
  # Retrieves an AddThis snippet for all active campaigns for one of your customers.
  def company
    self.class.post('/company/get')
  end
end