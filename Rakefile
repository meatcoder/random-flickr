task :default do 
  require 'rubygems'
  require 'bundler'
  Bundler.require(:default)
  
  require './web'
  
  Bundler.require(:test)
  require 'mocha'
  require './test'
  
  ENV['RACK_ENV'] = 'test'
end
