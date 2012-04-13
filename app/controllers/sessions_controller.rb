class SessionsController < ApplicationController
    
  def create
   @user = User.find_or_create_user_from_hash(auth_hash)
   if @user 
     self.current_user = @user
     redirect_to '/'
   else
     Rails.logger.error("Session#Create pork")
   end
  end


  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
