Rails.application.config.middleware.use OmniAuth::Builder do
  provider :intercom, ENV['client_id'], ENV['client_secret']
end
