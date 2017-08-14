# Frozen-string-literal: true
# Copyright: 2017 Jordon Bedwell - MIT License
# Encoding: utf-8

require "rspec/helper"

describe Jekyll::Cache do
  let :cache do
    described_class::FileStore.new("rspec")
  end

  #

  describe ".cache" do
    it "should be a FileStore" do
      expect(Jekyll.cache).to(be_a(Jekyll::Cache::FileStore))
    end
  end

  #

  describe ".clear" do
    before :each do
      cache.write("hello", "world")
      expect(cache.read("hello")).
        to(eq("world"))
    end

    #

    it "should delete the directory" do
      cache.clear
      expect(cache.read("hello")).
        to(be_nil)
    end
  end

  after do
    described_class.clear
  end
end
