require './config/environment.rb'
require 'sinatra/activerecord/rake'

namespace :db do
  task :load_config do
    require "./app"
  end
end

namespace :nonce do 
  task :getter do 
    LendingTree::NonceGetter.call
  end
end
