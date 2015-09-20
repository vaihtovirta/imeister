$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'imeister'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = 'spec/support/vcr_cassettes'
  c.allow_http_connections_when_no_cassette = true
  c.default_cassette_options = { record: :new_episodes }
end
