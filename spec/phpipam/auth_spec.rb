# frozen_string_literal: true
require 'spec_helper'
require './lib/phpipam'
require './lib/phpipam/auth'
require 'json'

RSpec.configure do |c|
  c.include Auth
end

RSpec.describe 'Authenticate and Authorize' do
  context '#POST authenticate' do
    before do
      @api_response = Array.new(24) { [*'a'..'z', *'A'..'Z', *'0'..'9'].sample }.join
      json = {'code' => 200, 'success' => true, 'data' => { 'token' => @api_response }}.to_json
      WebMock.stub_request(:post, 'http://example.com/bulletproof/user/')
             .with(:headers => {'Accept' => '*/*',
                                'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                                'Authorization' => 'Basic dXNlcm5hbWU6cGFzc3dvcmQ=',
                                'User-Agent' => 'Ruby'})
             .to_return(:status => 200,
                        :body => json,
                        :headers => {'Accept' => 'application/json'})
    end

    it 'should authenticate and return a token' do
      client = Phpipam::Api.new('bulletproof', 'http://example.com')
      auth = client.authenticate('username', 'password')
      client_response = JSON.parse(auth, :quirks_mode => true)
      token = client_response['data']['token']
      expect(token).to eq @api_response
    end
  end
end
