class Book < ApplicationRecord
  belongs_to :publisher
  belongs_to :category
  belongs_to :author
  validates :title, presence: true, uniqueness: true, length: {minimum:3, maximum:25}
  validates :isbn, presence: true
  validates :year, presence: true
  validates :price, presence: true
  validates :buy, presence: true
  validates :excerpt, presence: true
  has_attached_file :image,
    :storage => :cloudinary,
    :path => ':class/:id/:style/:filename'
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  validates :image_file_name, presence: true
end