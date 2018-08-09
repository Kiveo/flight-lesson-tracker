Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :github, 'b94b4c85eeb2abf042ab', '151f531bbcad077a93a2f9039110c2cfa6ecb13a'
end