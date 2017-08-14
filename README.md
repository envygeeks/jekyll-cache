<p align=center>
  <a href=https://goo.gl/BhrgjW>
    <img src=https://envygeeks.io/badges/paypal-large_1.png alt=Donate>
  </a>
  <br>
  <a href=https://travis-ci.org/envygeeks/jekyll-cache>
    <img src="https://travis-ci.org/envygeeks/jekyll-cache.svg?branch=master">
  </a>
</div>

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
