class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  STDOUT = 'logs/application.log'
  STDERR = 'logs/error.log'

  get '/' do 
    app_logger.info("#{env['REQUEST_METHOD']} #{env['REQUEST_PATH']}")
    'Home Page'
  end

  error do
    error_logger.debug("error class: #{env['sinatra.error'].class}, error message: #{env['sinatra.error'].message}")
    error 500, 'An unexpected error occurred on our servers.'
  end

  def app_logger
    @app_logger ||= Logger.new(STDOUT)
  end

  def error_logger
    @error_logger ||= Logger.new(STDERR)
  end
end