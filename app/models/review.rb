class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :meal
    validates :title, presence: true
    validates :body, presence: true
end