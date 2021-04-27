class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :meal
      t.string :location
      t.date :date
      t.text :body
      t.integer :user_id
      t.integer :meal_id
    end
  end
end
