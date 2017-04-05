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
