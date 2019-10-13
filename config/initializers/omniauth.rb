OmniAuth.config.logger = Rails.logger

#Rails.application.config.middleware.use OmniAuth::Builder do
 # provider :facebook,ENV['app_ID'], ENV['app_secret'], provider_ignores_state: true,
  #client_options: {
  #    site: 'https://graph.facebook.com/v3.0',  # this is the example API version
  #    authorize_url: "https://www.facebook.com/v3.0/dialog/oauth"
  #  },#ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
#  secure_image_url: true
#end