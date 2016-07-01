#require_relative "phpipam/version"
require "rubygems"
require "httparty"
require 'ipaddr'
require_relative 'phpipam/auth'
require_relative 'phpipam/subnets'

class Phpipam
  include HTTParty
  include Auth
  include Subnets

  base_uri 'http://10.128.16.244/'

  def app_name
    'bulletproof'
  end
end
