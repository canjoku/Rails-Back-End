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

  if Rails.env.production?
    OmniAuth.config.on_failure = Proc.new { |env|
      message_key = env['omniauth.error.type']
      error_description = Rack::Utils.escape(env['omniauth.error'].error_reason)
      new_path = "#{env['SCRIPT_NAME']}#{OmniAuth.config.path_prefix}/failure?message=#{message_key}&error_description=#{error_description}"
      Rack::Response.new(['302 Moved'], 302, 'Location' => new_path).finish
    }
  end
end

