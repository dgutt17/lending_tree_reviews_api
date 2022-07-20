module Exceptions
  class ApiWrapperError < StandardError
    attr_accessor :message, :error_code
    
    def initialize(message, error_code)
      @message = message
      @error_code = error_code
    end
  end
end