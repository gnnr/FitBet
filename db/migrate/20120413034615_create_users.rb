class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :email
      t.string :name
      t.string :nickname
      t.string :first_name
      t.string :last_name
      t.string :location
      t.text :description
      t.string :info 
      t.string :image
      t.string :phone
      t.string :current_gym
      t.string :auth_hash
      t.timestamps
    end
  end
end
