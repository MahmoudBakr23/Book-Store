class Category < ApplicationRecord
    has_many :books, class_name: "Book", foreign_key: "category_id", dependent: :destroy
    validates :name, presence: true, uniqueness: true, length: {minimum:3}
end
