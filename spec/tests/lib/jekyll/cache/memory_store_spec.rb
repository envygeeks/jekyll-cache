# Frozen-string-literal: true
# Copyright: 2017 Jordon Bedwell - MIT License
# Encoding: utf-8

describe Jekyll::Cache::MemoryStore do
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
      expect(cache.middleware).to(be_nil)
    end
  end

  #

  after do
    described_class.clear
  end
end
