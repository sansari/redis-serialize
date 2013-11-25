$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
$LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib')))
require 'mock_redis'
require 'redis_serialize'
require 'rspec'

RSpec.configure do |config|
	REDIS = MockRedis.new

	config.before(:each) do
		REDIS.flushall
	end
end
