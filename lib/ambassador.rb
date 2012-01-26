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
    self.class.get('/event/record', params)
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
    self.class.get('/ambassador/get', params)
  end
  
  # Retrieves a list of up to 100 ambassadors, optionally filtered by the parameters below.
  # :page
  # :min_money
  # :min_points
  # :min_referrals
  def ambassadors(params = {})
    self.class.get('/ambassador/all', params)
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
    self.class.get('/balance/deduct', params)
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
    self.class.get('/balance/add', params)
  end
  
  # Retrieves the referring ambassador and campaign information tied to an “mbsy” shortcode.
  # :short_code        [required]
  # :sandbox
  def add_balance(params = {})
    self.class.get('/shortcode/get', params)
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
    self.class.get('/social/addthis', params)
  end
  
  # Retrieves an AddThis snippet for all active campaigns for one of your customers.
  def company
    self.class.get('/company/get')
  end
end