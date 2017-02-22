require 'rack'
require 'ffaker'
require_relative 'application'
require_relative 'ipsum'
require_relative 'html'
require_relative 'page'

Rack::Handler::WEBrick.run LipsumGenerator
