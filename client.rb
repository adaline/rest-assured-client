require 'rest-client'

bank_url = 'http://localhost:3000/api/v1'

class RestAssured
  def initialize(url, secret_key)
    @secret_key = secret_key
    @url = url	
  end
  def accounts
    RestClient.get @url + '/accounts', nil, { authorization: @secret_key }
  end
  def transactions
    RestClient.get @url + '/transctions', nil, { authorization: @secret_key }
  end
  def create_transaction(destination, quantity)
    RestClient.post @url + '/transactions', { destination: destination, quantity: quantity }.to_json, { authorization: @secret_key }
  end
end
