# Local Sidekiq Dashboard

## install

```shell
  bundle install
```

comment out this section if you need basic auth

```ruby
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
```

## start

```shell
  rackup config.ru
```
