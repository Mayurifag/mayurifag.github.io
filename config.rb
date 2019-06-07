# frozen_string_literal: true

activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

activate :livereload
activate :meta_tags
activate :inliner

configure :build do
  activate :minify_css, inline: true
  activate :minify_javascript, inline: true
  activate :minify_html
  activate :relative_assets
  activate :asset_hash
  activate :gzip

  activate :favicon_maker, icons: {
    '_favicon_template.png' => [
      { icon: 'apple-touch-icon-180x180-precomposed.png' },
      { icon: 'apple-touch-icon-152x152-precomposed.png' },
      { icon: 'apple-touch-icon-144x144-precomposed.png' },
      { icon: 'apple-touch-icon-120x120-precomposed.png' },
      { icon: 'apple-touch-icon-114x114-precomposed.png' },
      { icon: 'apple-touch-icon-76x76-precomposed.png' },
      { icon: 'apple-touch-icon-72x72-precomposed.png' },
      { icon: 'apple-touch-icon-60x60-precomposed.png' },
      { icon: 'apple-touch-icon-57x57-precomposed.png' },
      { icon: 'apple-touch-icon-precomposed.png', size: '57x57' },
      { icon: 'apple-touch-icon.png', size: '57x57' },
      { icon: 'favicon-196x196.png' },
      { icon: 'favicon-160x160.png' },
      { icon: 'favicon-96x96.png' },
      { icon: 'favicon-32x32.png' },
      { icon: 'favicon-16x16.png' },
      { icon: 'favicon.png', size: '16x16' },
      { icon: 'favicon.ico', size: '64x64,32x32,24x24,16x16' },
      { icon: 'mstile-70x70.png', size: '70x70' },
      { icon: 'mstile-144x144.png', size: '144x144' },
      { icon: 'mstile-150x150.png', size: '150x150' },
      { icon: 'mstile-310x310.png', size: '310x310' },
      { icon: 'mstile-310x150.png', size: '310x150' }
    ]
  }
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.branch        = 'master'
  deploy.build_before  = true
end

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-141293812-1'
  ga.minify = true
end
