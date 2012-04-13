# This file is used by Rack-based servers to start the application.
require 'rubygems'
require 'bundler'
require 'omniauth'
require 'omniauth-google-oauth2'
# require 'omniauth-twitter'
require 'omniauth-facebook'

require ::File.expand_path('../config/environment',  __FILE__)
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

use Rack::Session::Cookie, :secret => ENV['RACK_COOKIE_SECRET']

run FitBet::Application
