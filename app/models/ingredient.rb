class Ingredient < ApplicationRecord
# validations
validates :name, presence: true, uniqueness: true
# associations
has_many :portions
end
