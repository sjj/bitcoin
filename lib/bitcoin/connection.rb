require 'faraday'
require 'faraday/request/url_encoded'
require 'faraday/response/raise_error'
require 'faraday/response/parse_json'
require 'faraday/response/raise_mtgox_error'
require 'faraday_middleware'

module Bitcoin
  module Connection
    private

    def mtGoxConnection
      options = {
        :headers  => {
          :accept => 'application/json',
          :user_agent => "mtgox",
        },
        :ssl => {:verify => false},
        :url => 'https://mtgox.com',
      }

      Faraday.new(options) do |connection|
        connection.use Faraday::Request::UrlEncoded
        connection.use Faraday::Response::RaiseError
        connection.use Faraday::Response::ParseJson
        connection.use Faraday::Response::RaiseMtGoxError
        connection.adapter(Faraday.default_adapter)
      end
    end
    
    def thUSDConnection
      options = {
        :headers  => {
          :accept => 'application/json',
          :user_agent => "thUSD",
        },
        :ssl => {:verify => false},
        :url => 'https://api.tradehill.com',
      }

      Faraday.new(options) do |connection|
        connection.use Faraday::Request::UrlEncoded
        connection.use Faraday::Response::RaiseError
        connection.use Faraday::Response::ParseJson
        connection.use Faraday::Response::RaiseMtGoxError
        connection.adapter(Faraday.default_adapter)
      end
    end
  end
end
