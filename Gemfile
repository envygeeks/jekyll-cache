# Frozen-string-literal: true
# Copyright: 2017 - MIT License
# Encoding: utf-8

source "https://rubygems.org"
gemspec

group :development do
  gem "pry"
  gem "rubocop"
  gem "rake"

  group :test do
    if ENV["JEKYLL_VERSION"]
      gem "jekyll", "~> #{ENV['JEKYLL_VERSION']}"
    end
  end
end
