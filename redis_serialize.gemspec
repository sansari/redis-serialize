# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "version"

Gem::Specification.new do |s|
  s.name        = 'redis-serialize'
  s.version     = RedisSerialize::VERSION
  s.date        = '2013-11-25'
  s.summary     = "Provides a redis_serialize DSL in ActiveRecord to serialize an array property with Redis as the store"
  s.description = "As an alternative to using the existing ActiveRecord serialize, which stores in a DB column, this DSL can be used to easily get a serialized array column which stores in Redis (more efficient, and handles growth of the array much better at scale)"
  s.authors     = ["Salman Ansari", "Brian Norton"]
  s.email       = 'salman.ansari@gmail.com'
  s.files       = ["lib/redis_serialize.rb"]
  s.test_files  = ["spec/redis_serialize_spec.rb"]
  s.homepage    = 'https://github.com/sansari/redis-serialize'
  s.license     = 'MIT'
end