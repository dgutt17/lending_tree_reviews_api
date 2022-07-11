require_relative 'app/controllers/application_controller.rb'
require_relative 'app/controllers/reviews_controller.rb'
require_relative 'app/models/business.rb'
set :database_file, 'config/database.yml'

class App < Sinatra::Base
  use ApplicationController
  use ReviewsController

  get '/' do 
    'Home Page'
  end
end