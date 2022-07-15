require 'rubygems'
require 'bundler'
require 'sinatra'
require 'redis'
require 'sinatra/activerecord'
require 'open-uri'
require 'nokogiri'

Bundler.require(:default)                   # load all the default gems
Bundler.require(Sinatra::Base.environment)  # load all the environment specific gems

require "active_support/deprecation"
require "active_support/all"