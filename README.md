# AerospikeCRubyRailsCache

Add to gemfile:

```ruby
gem "aerospike_c_ruby", github: 'itelab/AerospikeCRuby'
gem 'aerospike_c_ruby_rails_cache', github: "Adam-Stomski/aerospike_c_ruby_rails_cache"
```

Initialize:

```ruby
config.cache_store = :aerospike_c_ruby_store, {
  host: '127.0.0.1',
  port: 3000,
  ns:   'test',
  set:  'cache',
  bin:  'entry',
}
```

Usage:

```ruby
Rails.cache.write('test', "testcache") # => true
Rails.cache.read('test') => "testcache"

Rails.cache.write('test', "testcache", expires_in: 5)
sleep 5
Rails.cache.read('test') => nil
```

## Copyright

2016 [Adam Stomski](https://github.com/Adam-Stomski), released under the MIT license