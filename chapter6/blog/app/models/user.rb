class User < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 2, maximum: 20}, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
  validates :password, presence: true, length: {minimum: 6, maximum: 16}
  has_many :posts

  has_secure_password
end

