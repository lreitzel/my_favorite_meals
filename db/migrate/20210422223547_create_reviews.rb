class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.integer :rating
      t.date :day_of_visit
      t.text :review_body
      t.integer :user_id
      t.integer :meal_id
    end
  end
end
