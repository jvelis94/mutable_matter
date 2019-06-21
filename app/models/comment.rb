class Comment < ApplicationRecord
  belongs_to :post
  has_many   :replies, dependent: :destroy
  accepts_nested_attributes_for :replies
end
