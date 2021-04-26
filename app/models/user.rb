class User < ActiveRecord::Base
    has_many :reviews
    # has_many :meals, through: :reviews
    has_secure_password
end