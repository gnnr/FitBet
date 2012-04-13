class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :gym_id
      t.integer :user_id
      t.datetime :time

      t.timestamps
    end
  end
end
