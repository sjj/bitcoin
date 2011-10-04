module Bitcoin
  module Request
    def getMtGox(path, options={})
      reqMtGox(:get, path, options)
    end
    
    def getThUSD(path, options={})
      reqThUSD(:get, path, options)
    end

    def post(path, options={})
      request(:post, path, options)
    end

    private

    def reqMtGox(method, path, options)
      response = mtGoxConnection.send(method) do |request|
        case method
        when :get
          request.url(path, options)
        when :post
          request.path = path
          request.body = options unless options.empty?
        end
      end
      response.body
    end
    
    def reqThUSD(method, path, options)
      response = thUSDConnection.send(method) do |request|
        case method
        when :get
          request.url(path, options)
        when :post
          request.path = path
          request.body = options unless options.empty?
        end
      end
      response.body
    end
  end
end
