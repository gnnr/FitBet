class SessionsController < ApplicationController
    
  def create
   @user = User.find_or_create_user_from_hash(auth_hash)
   if @user 
     Rails.logger.notice("Created a new user named #{user.name}")
     self.current_user = @user
     redirect_to '/'
   else
     Rails.logger.error("Session#Create pork")
     flash[:error] = "Something went wrong during creating the user session"
   end
  end

  protected
  # Just an alias for grabbing the auth hash out of rack's env.
  def auth_hash
    request.env['omniauth.auth']
  end
end
