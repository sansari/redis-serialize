redis-serialize
===============

Simple DSL alternative to ActiveRecord serialize, which stores in Redis instead of a text column.

GETTING STARTED:
1. gem install 'redis-serialize'
2. Ensure that your redis connection is available via a global 'REDIS' variable
3. Add a declaration in your ActiveRecord model (e.g. redis_serialize :my_things)
4. Use the column as an array, with the methods below.

TODO: 
=> Currently, a Redis connection is accessed through a conventional REDIS variable. Need to find a way to make this abstract/configurable enough that anyone could just drop in this gem and have it work for their existing convention for connecting to Redis.
=> The current implementation only supports an array serialized column. Consider adding support for hashes?