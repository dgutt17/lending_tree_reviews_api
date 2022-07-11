require 'app/controllers/reviews_controller.rb'
set :database_file, 'config/database.yml'

class App < Sinatra::Base
  use ReviewsController

  get '/' do 
    'Home Page'
  end
end