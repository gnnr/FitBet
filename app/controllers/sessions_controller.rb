require 'yaml'

class SessionsController < ApplicationController
    
  def create
   user = User.find_or_create_user_from_hash(auth_hash) 
   self.current_user = @user
   redirect_to '/'
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
