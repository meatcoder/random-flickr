task :default do 
  require 'rubygems'
  require 'bundler'
  Bundler.require(:default)
  
  require './web'
  
  Bundler.require(:test)
  require 'test/unit'
  require './test'
  
  ENV['RACK_ENV'] = 'test'
end