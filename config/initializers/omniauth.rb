OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :myvr, ENV['MYVR_CLIENT_ID'], ENV['MYVR_CLIENT_SECRET'], scope: 'full'
end
