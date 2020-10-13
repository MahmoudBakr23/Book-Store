class Book < ApplicationRecord
    belongs_to :category
    belongs_to :author
    belongs_to :publisher
    validates :title, presence: true, uniqueness: true, length: {minimum:3, maximum:25}
    validates :isbn, presence: true
    validates :year, presence: true
    validates :price, presence: true
    validates :buy, presence: true
    validates :excerpt, presence: true
    has_attached_file :image
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
    validates :image_file_name, presence: true
  end
  