class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, presence: true, length: {maximum: 20}, uniqueness: true
  validates :text, presence: true, length: {minmum: 50, maximum: 20000}
end
