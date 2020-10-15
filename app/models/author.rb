class Author < ApplicationRecord
    has_many :books, dependent: :destroy
    validates :first_name, presence: true, length: {minimum:3, maximum:18}
    validates :last_name, presence: true, uniqueness: true, length: {minimum:3, maximum:18}
end
