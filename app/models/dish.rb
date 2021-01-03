class Dish < ApplicationRecord

#associations
has_many :portions, dependent: :destroy
has_many :ingredients, through: :portions
end
