task :default do 
  require 'rubygems'
  require 'bundler'
  Bundler.require(:default, :test)
  
  require './web'
  require 'test/unit'
  require './test'
  
  ENV['RACK_ENV'] = 'test'
end