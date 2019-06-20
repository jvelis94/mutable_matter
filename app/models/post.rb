class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :replies, through: :comments
  has_many :post_photos
end
