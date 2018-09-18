Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    ENV.fetch('CLIENT_ID'),
    ENV.fetch('CLIENT_SECRET'),
    ENV.fetch('DOMAIN'),
    callback_path: '/auth/oauth2/callback',
    authorize_params: {
      scope: 'openid profile',
      audience: 'https://tn-blog.eu.auth0.com/userinfo'
    }
  )
end

