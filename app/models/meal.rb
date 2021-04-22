class Meal < ActiveRecord::Base
    belongs_to :restaurant
    has_many :reviews
end