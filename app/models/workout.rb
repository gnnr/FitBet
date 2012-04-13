class Workout < ActiveRecord::Base
  attr_accessible :gym_id, :time, :user_id
end
