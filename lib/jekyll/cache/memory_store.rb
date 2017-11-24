# Frozen-string-literal: true
# Copyright: 2017 Jordon Bedwell - MIT License
# Encoding: utf-8

require "active_support/cache"
require_relative "../cache"

module Jekyll
  module Cache
    class MemoryStore < ActiveSupport::Cache::MemoryStore
      def self.clear
        Cache.method(:clear).call
      end

      # --
      # @return [<EnvyGeeks::Cache>] the cache
      # Overrides the default method so that we can simply
      #   pass in the name of the directory we want to store
      #   cache files inside of
      # @see https://goo.gl/3G35gw
      # --
      def initialize(*args)
        self.logger = Cache.logger
        super(*args)
      end

      # --
      def middleware
        nil
      end
    end
  end
end
