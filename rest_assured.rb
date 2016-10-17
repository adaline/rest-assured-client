require 'rest-client'
require 'json'

# For list of rest-client methods see:
# https://github.com/rest-client/rest-client/blob/master/lib/restclient.rb#L64

class RestAssured
  def initialize(url, secret_key)
    @secret_key = secret_key
    @url = url
  end

  def transactions
    RestClient.get(
      "#{@url}/transactions",
      headers
    )
  end

  def create_transaction(destination, quantity)
    begin
     RestClient.post(
        "#{@url}/transactions",
        { destination: destination, quantity: quantity }.to_json,
        headers
      )
     rescue RestClient::ExceptionWithResponse => e
     e.response
   end
  end

  private

  def headers
    { authorization: @secret_key, content_type: :json }
  end
end

# require './rest_assured'
# rest_assured = RestAssured.new('http://xxxx/api', 'xxxx')
# puts rest_assured.transactions
