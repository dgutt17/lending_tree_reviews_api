class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do 
    'Home Page'
  end

  error do
    error 500, 'An unexpected error occurred on our servers.'
  end
end