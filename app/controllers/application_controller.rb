class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do 
    'Home Page'
  end
end