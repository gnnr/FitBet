class Gym < ActiveRecord::Base
  attr_accessible :city, :country, :description, :image, :name, :phone_number, :state, :website, :zip
end
