class User < ActiveRecord::Base
  attr_accessible :current_gym, :description, :email, :first_name, :image, :last_name, :location, :name, :nickname, :phone, :provider, :uid 

  def self.find_or_create_user_from_hash(hash)
    user = User.where(:uid => hash['uid'], :provider => hash['provider']).first()
    unless user 
      case hash['info']
        when "facebook"
          User.create_user_from_facebook_auth_hash(hash)
        when "google_oauth2"
          User.create_user_from_google_auth_hash(hash)
        else
          Rails.logger.error("Something has gone wrong in the creation of a user from #{hash.inspect}")
      end
    end
  end

  protected
  
  def create_user_from_generic_hash(hash)
    user = User.create(:provider => hash['provider'],
                :uid      => hash['uid'],  
                :email    => hash['email'],
                :name     => hash['name'],
                :image    => hash['image'],
                :token    => hash['credentials']['token'])
  end

  def self.create_user_from_facebook_auth_hash(hash)
    create_user_from_generic_hash(hash)
  end

  def self.create_user_from_google_auth_hash()
    create_user_from_generic_hash(hash)
  end

end
