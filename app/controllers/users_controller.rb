class UsersController < ApplicationController
  def login
    return unless params[:username]
    authenticator = Rails.env.production? ? SimpleLDAP : SimpleLDAP::Stub
    data = authenticator.authenticate(params[:username], params[:password], 'ldap.stuba.sk', 389, 'ou=People,dc=stuba,dc=sk')
    if data.nil?
      flash[:notice] = 'Login failed. Invalid credentials.'
    else
      user = User.find_or_create_by_username(:username => params[:username], :name => data['cn'].first)
      session[:user] = user
      flash[:notice] = 'You have successfully logged in.'
    end
    redirect_to '/'
  end
end
