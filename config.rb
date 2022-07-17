# frozen_string_literal: true

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :livereload, host: "0.0.0.0", no_swf: true
activate :inliner

configure :build do
  activate :minify_css, inline: true
  # activate :minify_javascript, inline: true
  activate :minify_html
  activate :relative_assets
  activate :asset_hash
  activate :gzip

  activate :favicon_maker, icons: {
    "images/main_icon.png" => [
      {icon: "apple-touch-icon.png", size: "180×180"},
      {icon: "favicon.png", size: "16x16"},
      {icon: "favicon.ico", size: "32x32"}
    ]
  }
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.branch = "master"
  deploy.build_before = true

  committer_app = "#{Middleman::Deploy::PACKAGE} v#{Middleman::Deploy::VERSION}"
  commit_message = "Deployed using #{committer_app}"

  commit_message += " (Travis Build \##{ENV["TRAVIS_BUILD_NUMBER"]})" if ENV["TRAVIS_BUILD_NUMBER"]

  deploy.commit_message = commit_message
end
