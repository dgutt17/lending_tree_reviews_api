class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do 
    'Home Page'
  end

  error do |err|
    puts "ERROR!!!!!!!!!!!!!!!!!"
  end
end