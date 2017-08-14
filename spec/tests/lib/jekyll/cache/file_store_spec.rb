# Frozen-string-literal: true
# Copyright: 2017 Jordon Bedwell - MIT License
# Encoding: utf-8

require "rspec/helper"

describe Jekyll::Cache::FileStore do
  before do
    described_class.clear
  end

  #

  let :cache do
    Jekyll::Cache::FileStore.new("rspec")
  end

  #

  describe "#middleware" do
    it "should be nil" do
      expect(cache.middleware).to(be_nil)
    end
  end

  #

  describe "#fetch" do
    context "opts[:expires_in]" do
      context "is set to 0.minutes" do
        it "should not save any cache entires" do
          result = cache.fetch("hello", expires_in: 0.minutes) { "world" }
          expect(result).to(eq("world"))
          expect(cache.read("hello")).
            to(be_nil)
        end
      end
    end
  end

  #

  describe "#expires_in" do
    it "should return a default expires" do
      expect(cache.send(:expires_in)).to(be_a(Integer))
    end
  end

  #

  after do
    described_class.clear
  end
end
