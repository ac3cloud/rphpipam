require_relative 'phpipam/version'
require 'rubygems'
require 'httparty'
require 'ipaddress'
require 'pry'
require_relative 'phpipam/auth'
require_relative 'phpipam/subnets'
require_relative 'phpipam/sections'
require_relative 'phpipam/vlans'
require_relative 'phpipam/vrfs'

module Phpipam
  class Api
    include HTTParty
    include Auth
    include Subnets
    include Sections
    include Vlans
    include Vrfs

    base_uri ENV['PHPIPAM_URL']

    def app_name
      ENV['PHPIPAM_APP']
    end
  end
end
