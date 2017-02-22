require 'rack'
require 'ffaker'
require_relative 'application'
require_relative 'ipsum'
require_relative 'html'

Rack::Handler::WEBrick.run Application
