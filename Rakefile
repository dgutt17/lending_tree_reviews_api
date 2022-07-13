require 'sinatra'
require 'sinatra/activerecord/rake'
require 'redis'
require './lib/nonce_getter.rb'

namespace :db do
  task :load_config do
    require "./app"
  end
end

namespace :nonce do 
  task :getter do 
    NonceGetter.new.run
  end
end