class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, presence: true, length: {minimum: 2, maximum: 20}, uniqueness: true
  validates :text, presence: true, length: {minimum: 50, maximum: 20000}
end
