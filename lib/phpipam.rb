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

  base_uri ENV['PHPIPAM_URL']

  def app_name
    ENV['PHPIPAM_NAME']
  end
end
