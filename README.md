[![Code Climate](https://img.shields.io/codeclimate/maintainability/envygeeks/jekyll-cache.svg?style=for-the-badge)](https://codeclimate.com/github/envygeeks/jekyll-cache/maintainability) [![Code Climate](https://img.shields.io/codeclimate/coverage/github/envygeeks/jekyll-cache.svg?style=for-the-badge)](https://codeclimate.com/github/envygeeks/jekyll-cache/test_coverage) [![Travis branch](https://img.shields.io/travis/envygeeks/jekyll-cache/master.svg?style=for-the-badge)](https://travis-ci.org/envygeeks/jekyll-cache) [![Donate](https://img.shields.io/badge/DONATE-USD-green.svg?style=for-the-badge)](https://envygeeks.io#donate) [![Gem](https://img.shields.io/gem/v/jekyll-cache.svg?style=for-the-badge)]()

# Jekyll Cache

Jekyll Cache provides a wrapper around `ActiveSupport::Cache` that allows you to cache in Jekyll without much trouble.  It defaults to `.jekyll-cache` for the cache and allows you to namespace your cache directory so you do not interfere with other caches.

## Usage

```ruby
cache = Jekyll::Cache::FileStore.new("myCache")
cache.fetch "key" do
  "val"
end

# Force Expirey
# Useful for development wrapping.
cache.fetch "key", :expires_in => 0.minutes do
  "val"
end
```

***We also provide a global cache.***

```ruby
Jekyll.cache.fetch "key" do
  "val"
end
```
