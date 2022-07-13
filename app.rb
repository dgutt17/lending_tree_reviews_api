Dir[File.join(".", "/app/**/*.rb")].each {|f| require f}
Dir[File.join(".", "/lib/*.rb")].each {|f| require f}
set :database_file, 'config/database.yml'

class App < Sinatra::Base
  use ApplicationController
  use ReviewsController
end