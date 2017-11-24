# Frozen-string-literal: true
# Copyright: 2017 Jordon Bedwell - MIT License
# Encoding: utf-8

describe Jekyll::Cache::MemoryStore do
  before do
    described_class.clear
  end

  #

  let :cache do
    Jekyll::Cache::NullStore.new
  end

  #

  it "works" do
    expect(cache.fetch("hello") { "world" }).to eq("world")
  end

  #

  after do
    described_class.clear
  end
end
