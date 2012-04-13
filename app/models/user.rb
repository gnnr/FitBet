class User < ActiveRecord::Base
  attr_accessible :current_gym, :description, :email, :first_name, :image, :last_name, :location, :name, :nickname, :phone, :provider, :uid
end
