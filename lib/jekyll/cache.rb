# Frozen-string-literal: true
# Copyright: 2017 Jordon Bedwell - MIT License
# Encoding: utf-8

require "jekyll/sanity"
require "jekyll/log_wrapper"
require "jekyll"


module Jekyll
  module Cache
    autoload   :FileStore, "jekyll/cache/file_store"
    autoload :MemoryStore, \
      "jekyll/cache/memory_store"

    # --
    # Clear the entire cache.
    # @note Doesn't matter if it exists.
    # @return [true,false]
    # --
    def self.clear
      if Jekyll.cache_dir && Jekyll.cache_dir.directory?
        return Jekyll.cache_dir.rm_rf
      end
    end

    # --
    # @return [Jekyll::LogWrapper]
    # Creates a log wrapper for ActiveSupport
    # @see Jekyll::LogWrapper
    # --
    def self.logger
      @logger ||= LogWrapper.new(Jekyll.logger)
    end
  end

  # --
  # @note this should always use FileStore.
  # A global cache that uses the FileStore. This is meant
  #   for quick caching (or) one off caching.
  # @return [FileStore] the new cache.
  # --
  def self.cache
    @cache ||= Cache::FileStore.new("global")
  end
end
