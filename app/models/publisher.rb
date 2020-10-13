class Publisher < ApplicationRecord
    has_many :books, class_name: "Book", foreign_key: "publisher_id", dependent: :destroy
    validates :name, presence: true, uniqueness: true, length: {minimum:3, maximum:15}
end
