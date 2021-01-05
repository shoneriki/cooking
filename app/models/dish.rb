class Dish < ApplicationRecord
# validations
validates :name, presence: true, uniqueness: true
# associations
has_many :portions, dependent: :destroy
has_many :ingredients, through: :portions
has_one_attached :photo
end
