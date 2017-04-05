# Ruby examples for MyVR Connect

Getting setup:

1. Install OmniAuth and MyVR Strategy gems

```rb
# Gemfile
gem 'omniauth'
gem 'omniauth-myvr'
```

2. Setup omniauth initializer

```rb
# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :myvr, ENV['MYVR_CLIENT_ID'], ENV['MYVR_CLIENT_SECRET'], scope: 'property_read'
end
```

3. Set your ENV vars

Your MyVR Client ID and Secret are available at developer.myvr.com

4. Setup a route to handle the callback

```rb

# config/routes.rb
# ...
get '/auth/:provider/callback', to: 'sessions#create'
# ...
```

5. Create a controller to handle auth

```rb
# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:token] = @user.token
    redirect_to '/examples'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
```
