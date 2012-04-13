class CreateGyms < ActiveRecord::Migration
  def change
    create_table :gyms do |t|
      t.string :zip
      t.string :city
      t.string :state
      t.string :country
      t.string :name
      t.string :description
      t.string :phone_number
      t.string :website
      t.string :image

      t.timestamps
    end
  end
end
