require 'rubygems'
require 'bundler'
require 'sinatra'
require 'redis'
require 'sinatra/activerecord'
require 'open-uri'
require 'nokogiri'
require 'pry-byebug'

Bundler.require(:default)                   # load all the default gems
Bundler.require(Sinatra::Base.environment)  # load all the environment specific gems

# We initialize the helpers first so we can avoid unintialized errors.
Dir[File.join(".", "/app/helpers/*.rb")].each {|f| require f}
Dir[File.join(".", "/app/**/*.rb")].each {|f| require f}
Dir[File.join(".", "/lib/**/*.rb")].each {|f| require f}

require "active_support/deprecation"
require "active_support/all"

ActiveRecord::Base.logger = Logger.new(LoggerHelper::STDOUT)