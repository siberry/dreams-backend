# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3001'

    resource '*',
      headers: :any, 
      methods: [:get, :post, :options, :put, :delete]

    # resource 'follows',
    #   headers: :any,
    #   methods: [:get, :post, :delete]
    # resource 'dream_tags',
    #   headers: :any,
    #   methods: [:get]
    # resource 'dreams',
    #   headers: :any,
    #   methods: [:get, :post, :delete, :patch, :put]
    # resource 'users',
    #   headers: :any,
    #   methods: [:get, :patch, :put, :delete, :post, :options]
  end
end
