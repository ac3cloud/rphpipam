require 'webmock/rspec'

RSpec.configure do |config|
  config.include WebMock::API
  config.order = :rand
  config.color_enabled = true
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true

  config.before(:each) do
    WebMock.reset!
  end
  config.after(:each) do
    WebMock.reset!
  end
end
