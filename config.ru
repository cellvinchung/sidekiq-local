# frozen_string_literal: true

require 'delegate'
require 'rack/session/cookie'
require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = {
    url: ENV.fetch('REDIS_URL', 'redis://localhost:6379'),
    size: 1
  }
end

require 'sidekiq/web'
require 'sidekiq-status/web'
require 'sidekiq_unique_jobs'
require 'sidekiq-scheduler/web'
require 'sidekiq_unique_jobs/web'
require 'sidekiq-statistic'

map '/' do
  # env_username = 'admin'
  # env_password = 'xxxxxx'

  # use Rack::Auth::Basic, "Protected Area" do |username, password|
  #   # Protect against timing attacks: (https://codahale.com/a-lesson-in-timing-attacks/)
  #   # - Use & (do not use &&) so that it doesn't short circuit.
  #   # - Use digests to stop length information leaking
  #   # Rack::Utils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(env_username)) &
  #   #   Rack::Utils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(env_username))
  #   username == env_username && password == env_password
  # end

  run Sidekiq::Web
end
