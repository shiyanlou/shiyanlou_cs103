class Comment < ActiveRecord::Base
  belongs_to :post
  validates :author, presence: true, length: {minmum: 1, maximum: 20}
  validates :content, length: {minmum: 5, maximum: 500}
end
