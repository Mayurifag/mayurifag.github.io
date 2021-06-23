# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Default gems
# gem "middleman", github: "middleman/middleman", branch: "4.x"
gem "middleman"
gem "middleman-autoprefixer", "~> 2.7"

# Middleman extensions
gem "middleman-deploy", "~> 2.0.0.pre.alpha"
gem "middleman-favicon-maker"
gem "middleman-inliner", github: "Mayurifag/middleman-inliner"
gem "middleman-livereload"
gem "middleman-minify-html"

# Common gems
gem "slim", ">= 3.0"

group :development do
  gem "capybara"
  gem "rake"
  gem "rspec"
  gem "standard"
end
