class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :review_body
      t.float :food_rating
      t.float :cleanliness_rating
      t.float :safety_rating
      t.float :facility_rating
      t.float :locality_rating
      t.integer :room_id
      t.integer :user_id

      t.timestamps
    end
  end
end
