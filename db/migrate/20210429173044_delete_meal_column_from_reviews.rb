class DeleteMealColumnFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :meal
  end
end
