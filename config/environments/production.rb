Rails.application.configure do
  # Enable full error reports
  config.consider_all_requests_local = true

  # Disable caching
  config.action_controller.perform_caching = false

  # Serve static files (like in development)
  config.public_file_server.enabled = true

  # Disable asset compilation (use dynamic serving like in development)
  config.assets.compile = true
  config.assets.debug = true

  # Other development-like settings...
end
