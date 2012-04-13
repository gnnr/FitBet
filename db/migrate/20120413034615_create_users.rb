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
      t.string :image
      t.string :phone
      t.string :current_gym

      t.timestamps
    end
  end
end
