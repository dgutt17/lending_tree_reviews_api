class Base
  include LoggerHelper

  NONCE = 'nonce'

  def self.call(*args)
    new(*args).call
  end
end