# Frozen-string-literal: true
# Copyright: 2017 - Jordon Bedwell - MIT License
# Encoding: utf-8


require "jekyll/sanity"
require "jekyll/log_wrapper"
require "jekyll"

module Jekyll
  module Cache
    autoload :FileStore, "jekyll/cache/file_store"
    autoload :MemoryStore, "jekyll/cache/memory_store"
    autoload :NullStore, "jekyll/cache/null_store"

    # --
    # Clear the entire cache.
    # @note Doesn't matter if it exists.
    # @return [true,false]
    # --
    def self.clear
      if Jekyll.cache_dir&.directory?
        then Jekyll.cache_dir.rm_r
      end
    end

    # --
    # @return [Jekyll::LogWrapper]
    # Creates a log wrapper for ActiveSupport
    # @see Jekyll::LogWrapper
    # --
    def self.logger
      logger = Jekyll.logger
      @logger ||= LogWrapper.new(logger)
    end
  end

  # --
  # @note this should always use FileStore.
  # A global cache that uses the FileStore. This is meant
  #   for quick caching (or) one off caching.
  # @return [FileStore] the new cache.
  # --
  def self.cache
    key = "global"
    @cache ||= Cache::FileStore.new(key)
  end
end

# --
Jekyll::Hooks.register :site, :after_init do |s|
  s.config["exclude"] << ".jekyll-cache/"
  s.config["exclude"].uniq!
end
