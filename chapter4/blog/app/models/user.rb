class User < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 2, maximum: 20}, uniqueness: true
  validates :email, presence: true, email: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6, maximum: 16}
  has_many :posts
end

