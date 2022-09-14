Unsplash.configure do |config|
  config.application_access_key = Rails.application.credentials.dig(:unsplash, :unsplash_access_key_id)
  config.application_secret = Rails.application.credentials.dig(:unsplash, :unsplash_secret_access_key)
  config.application_redirect_uri = 'https://your-application.com/oauth/callback'
  config.utm_source = 'alices_terrific_client_app'
end
