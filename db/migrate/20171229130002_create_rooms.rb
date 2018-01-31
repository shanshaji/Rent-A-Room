class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.float :price
      t.text :rules
      t.text :address
      t.string :images
      t.decimal :latitude, {:precision=>10, :scale=>6}
      t.decimal :longitude,{:precision=>10, :scale=>6}
      t.integer :city_id
      t.integer :user_id

      t.timestamps
    end
  end
end
