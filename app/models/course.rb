class Course < ApplicationRecord
    has_many :enrollment
    validates :name, presence: true
    validates :seats, presence: true
end
