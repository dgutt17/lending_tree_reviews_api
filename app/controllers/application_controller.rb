require 'sinatra'
require 'sinatra/activerecord/rake'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/' do 
    'Home Page'
  end
end