# frozen_string_literal: true

require "rspec"
require "capybara/rspec"

require "middleman-core"
require "middleman-core/rack"
require "middleman-autoprefixer"
require "middleman-livereload"
require "middleman-meta-tags"
require "middleman-inliner"
require "middleman-deploy"

middleman_app = ::Middleman::Application.new {
  set :root, File.expand_path(File.join(File.dirname(__FILE__), ".."))
  set :environment, :development
  set :show_exceptions, false
}

Capybara.app = ::Middleman::Rack.new(middleman_app).to_app
