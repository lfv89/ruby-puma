require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'puma'
end

require 'puma/configuration'

app = ->(_) { ['200', {'Content-Type' => 'text/html'}, ['Hello, World!']] }

config = Puma::Configuration.new({}) do |user_config, _|
  user_config.app(app)
  user_config.port(3000)
end

Puma::Launcher.new(config).run
