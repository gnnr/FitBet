class User < ActiveRecord::Base
  attr_accessible :current_gym, :description, :email, :first_name, :image, :last_name, :location, :name, :nickname, :phone, :provider, :uid 

  def self.find_or_create_user_from_hash(hash)
    result_proxy = User.where(:uid => hash['uid'], :provider => hash['provider'])
    # Build the results, if there exist any, select the first 
    if result_proxy
      return result_proxy.first()
    end
    unless user 
      case hash['info']
        when "facebook"
          return User.create_user_from_facebook_auth_hash(hash)
        when "google_oauth2"
          return User.create_user_from_google_auth_hash(hash)
        else
          flash[:error] = "Something has gone wrong in creating your user, this is bad!" 
          Rails.logger.error("Something has gone wrong in the creation of a user from #{hash.inspect}")
      end
    end
  end

  protected
  
  def create_user_from_generic_hash(hash)
    user = User.new(:provider => hash['provider'],
                :uid      => hash['uid'],  
                :email    => hash['email'],
                :name     => hash['name'],
                :image    => hash['image'],
                :token    => hash['credentials']['token'])
    ### There used to be claimed space here, now there is
    ### No longer
    user.save
    return user
  end

  def self.create_user_from_facebook_auth_hash(hash)
    create_user_from_generic_hash(hash)
    # Methods specific to FB login should go here
  end

  def self.create_user_from_google_auth_hash()
    create_user_from_generic_hash(hash)
    # Methods specific to G+ login should go here
  end

end
