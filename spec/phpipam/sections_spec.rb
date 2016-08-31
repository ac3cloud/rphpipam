# frozen_string_literal: true
require 'spec_helper'
require './lib/phpipam'
require './lib/phpipam/sections'

RSpec.configure do |c|
  c.include Sections
end

RSpec.describe 'sections' do
  before(:each) do
    @token = Array.new(24) { [*'a'..'z', *'A'..'Z', *'0'..'9'].sample }.join
    data = {}
    json = {'code' => 200, 'success' => true, 'data' => data}.to_json
    WebMock.stub_request(:post, 'http://example.com/exampleapp/user/')
           .with(:headers => {'Accept' => '*/*',
                              'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                              'Authorization' => 'Basic dXNlcm5hbWU6cGFzc3dvcmQ=',
                              'User-Agent' => 'Ruby'})
           .to_return(:status => 200,
                      :body => json,
                      :headers => {'Accept' => 'application/json'})
  end
  context '#GET all_sections' do
    let(:data) do
    end

    it 'gets all sections' do
    end
  end

  it '#GET section_with_id' do
  end

  it '#GET section_with_name' do
  end

  it '#GET section_subnets' do
  end

  it '#POST create' do
  end

  it '#PATCH update' do
  end
end
