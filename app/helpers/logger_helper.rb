module LoggerHelper
  STDOUT = 'logs/application.log'
  STDERR = 'logs/error.log'

  def app_logger
    @app_logger ||= Logger.new(STDOUT)
  end

  def error_logger
    @error_logger ||= Logger.new(STDERR)
  end
end