require 'pry'
require 'lean_coffee'
require_relative '../lib/hecks/active_model'

APP = HecksApp::ApplicationPort

APP.config do
  domain LeanCoffee
end
