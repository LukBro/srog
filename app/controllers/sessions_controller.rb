class SessionsController < ApplicationController
  def create
    sign = Sign.from_omniauth(env['omniauth.auth'])
    session[:sign_id] = sign.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
