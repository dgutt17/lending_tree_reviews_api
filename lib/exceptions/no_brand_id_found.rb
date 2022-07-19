module Exceptions
  class NoBrandIdFound < StandardError
    attr_reader :url

    def initialize(url)
      @url = url
    end

    def message
      %{
        No Brand Id was found with the received lendingtree.com url.
        URL: #{url}
      }
    end
  end
end