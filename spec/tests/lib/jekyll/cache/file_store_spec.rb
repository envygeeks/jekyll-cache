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
    it "nil" do
      expect(cache.middleware).to be_nil
    end
  end

  #

  describe "#fetch" do
    context "w/ opts[:expires_in]" do
      context "w/ 0.minutes" do
        let :result do
          cache.fetch "hello", expires_in: 0.minutes do
            "world"
          end
        end

        #

        it "doesn't save" do
          expect(result).to(eq("world"))
          expect(cache.read("hello")).to \
            be_nil
        end
      end
    end
  end

  #

  describe "#expires_in" do
    it "gives Int" do
      expect(cache.send(:expires_in)).to be_a(Integer)
    end
  end

  #

  after do
    described_class.clear
  end
end
