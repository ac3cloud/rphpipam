# frozen_string_literal: true
require 'webmock/rspec'
require 'yaml'

RSpec.configure do |config|
  config.include WebMock::API
  config.order = :rand
  config.run_all_when_everything_filtered = true
  WebMock.disable_net_connect!(:allow_localhost => true)

  config.before(:each) do
    WebMock.reset!
  end
  config.after(:each) do
    WebMock.reset!
  end
end
