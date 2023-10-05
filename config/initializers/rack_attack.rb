class Rack::Attack
    Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
  
    # Customize the throttle response message
    blocklist('block /sidekiq') do |req|
  if req.path == '/sidekiq'
    # Customize the block response
    {
      response: "Access to /sidekiq is blocked",
      status: 404
    }
  end
end
  end
  