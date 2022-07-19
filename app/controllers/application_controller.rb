class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  include LoggerHelper

  get '/' do 
    app_logger.info("#{env['REQUEST_METHOD']} #{env['REQUEST_PATH']}")
    'Home Page'
  end
  
  error ActiveRecord::RecordInvalid do
    error_logger.debug("error class: #{env['sinatra.error'].class}, error message: #{env['sinatra.error'].message}")
    error 400, env['sinatra.error'].message
  end

  error Exceptions::NoBrandIdFound do
    error_logger.debug("error class: #{env['sinatra.error'].class}, error message: #{env['sinatra.error'].message}")
    error 400, env['sinatra.error'].message
  end
  
  error do
    error_logger.debug("error class: #{env['sinatra.error'].class}, error message: #{env['sinatra.error'].message}")
    error 500, 'An unexpected error occurred on our servers.'
  end
end