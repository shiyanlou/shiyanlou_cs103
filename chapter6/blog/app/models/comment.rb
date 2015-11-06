class Comment < ActiveRecord::Base
  belongs_to :post
  validates :author, presence: true, length: {minimum: 1, maximum: 20}
  validates :content, length: {minimum: 5, maximum: 500}
end
