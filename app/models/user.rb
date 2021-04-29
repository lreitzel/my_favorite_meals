class User < ActiveRecord::Base
    has_many :reviews
    has_many :meals, through: :reviews
    has_secure_password
    validates :username, presence: true
    validates :password, presence: true
    validates :name, presence: true
end