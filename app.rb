set :database_file, 'database.yml'

class App < Sinatra::Base
  include LoggerHelper

  use ApplicationController
  use ReviewsController

  error Sinatra::NotFound do
    error_logger.debug("Route not found: #{env['sinatra.error'].message}")
    error 404, "Sent a route that does not exist."
  end
end