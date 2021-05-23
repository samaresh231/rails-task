class Student < ApplicationRecord
    has_many :enrollment
    validates :name, presence: true
end
