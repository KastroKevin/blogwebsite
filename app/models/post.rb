class Post < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  has_one_attached :image

  belongs_to :user

  has_many :comments

  paginates_per 4
end
