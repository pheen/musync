redis_uri = URI.parse(ENV['REDIS_URL'] || 'redis://localhost:6379/' )
REDIS = Redis.new(
  :host => redis_uri.host,
  :port => redis_uri.port,
  :password => redis_uri.password
)
