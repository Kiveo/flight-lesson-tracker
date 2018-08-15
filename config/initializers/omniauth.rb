Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :github, 'useyourkey', 'useyourpasskey'
end
