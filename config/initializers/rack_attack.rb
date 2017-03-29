class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new

  Rack::Attack.throttle('req/ip', limit: 5, period: 1.second) do |req|
    req.ip
  end

  Rack::Attack.throttled_response = lambda do |env|
    # Using 503 because it may make attacker think that they have successfully
    # DOSed the site. Rack::Attack returns 429 for throttling by default
    [ 503, {}, ["Server Error\n"]]
  end
end
