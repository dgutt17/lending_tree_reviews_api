require './config/environment.rb'
require 'sinatra/activerecord/rake'

Dir[File.join(".", "/app/**/*.rb")].each {|f| require f}
Dir[File.join(".", "/lib/**/*.rb")].each {|f| require f}

namespace :db do
  task :load_config do
    require "./app"
  end
end

namespace :nonce do 
  task :getter do 
    LendingTree::NonceGetter.new.call
  end
end
