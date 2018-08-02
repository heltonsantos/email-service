Sidekiq.configure_server do |config|
  config.redis = { :namespace => 'SidekiqEmail', url: 'redis://localhost:6379/1' }
end

Sidekiq.configure_client do |config|
  config.redis = { :namespace => 'SidekiqEmail', url: 'redis://localhost:6379/1' }
end