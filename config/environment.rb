require 'rubygems'
require 'bundler'
require 'sinatra'
require 'redis'
require 'sinatra/activerecord'
require 'open-uri'
require 'nokogiri'
require 'pry-byebug'
require 'fileutils'

Bundler.require(:default)                   # load all the default gems
Bundler.require(Sinatra::Base.environment)  # load all the environment specific gems

# We initialize the helpers and application service first so we can avoid unintialized errors.
require './app/services/application_service.rb'
Dir[File.join(".", "/app/helpers/*.rb")].each {|f| require f}
Dir[File.join(".", "/lib/**/*.rb")].each {|f| require f}
Dir[File.join(".", "/app/**/*.rb")].each {|f| require f}

require "active_support/deprecation"
require "active_support/all"

if !Dir.exist?(LoggerHelper::LOGS)
  Dir.mkdir(LoggerHelper::LOGS)
  FileUtils.touch(LoggerHelper::STDOUT)
  FileUtils.touch(LoggerHelper::STDERR)
end

ActiveRecord::Base.logger = Logger.new(LoggerHelper::STDOUT)