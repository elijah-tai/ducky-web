OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1510492709237188", "40f5c760ae7f88497283bf096a2860d1"
end