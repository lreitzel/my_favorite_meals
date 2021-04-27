class Meal < ActiveRecord::Base
    has_many :reviews
end