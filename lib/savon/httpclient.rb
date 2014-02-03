require 'httpclient'

class Savon
  class HTTPClient

    def initialize
      @client = ::HTTPClient.new
      @client.ssl_config.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    # Public: Returns the HTTPClient instance to configure.
    attr_reader :client

    # Public: Executes an HTTP GET request to a given url.
    #
    # Returns the raw HTTP response body as a String.
    def get(url)
      request(:get, url, {}, nil)
    end

    # Public: Executes an HTTP POST request to a given url with headers and body.
    #
    # Returns the raw HTTP response body as a String.
    def post(url, headers, body)
      request(:post, url, headers, body)
    end

    private

    def request(method, url, headers, body)
      response = @client.request(method, url, nil, body, headers)
      response.content
    end

  end
end
