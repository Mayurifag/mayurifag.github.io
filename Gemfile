# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Default gems
gem 'middleman', github: 'Mayurifag/middleman', branch: '4.x'
gem 'middleman-autoprefixer', '~> 2.7'

# Middleman extensions
gem 'middleman-deploy', '~> 2.0.0.pre.alpha'
gem 'middleman-favicon-maker'
gem 'middleman-inliner', github: 'Mayurifag/middleman-inliner'
gem 'middleman-livereload'
gem 'middleman-meta-tags'
gem 'middleman-minify-html'

# Common gems
## Using 2.0.8 due to error of Content-Length during build
## More info: https://github.com/middleman/middleman/issues/2309
gem 'rack', '~> 2.0.8'
gem 'slim', '>= 3.0'

group :development do
  gem 'capybara'
  gem 'rake'
  gem 'rspec'
  gem 'rubocop'
end
