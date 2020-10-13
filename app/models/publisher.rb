class Publisher < ApplicationRecord
    has_many :books, dependent: :destroy
    validates :name, presence: true, uniqueness: true, length: {minimum:3, maximum:15}
end
