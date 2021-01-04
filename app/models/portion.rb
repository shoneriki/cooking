class Portion < ApplicationRecord
# validations
  validates :description, presence: true
  validates :dish, uniqueness: { scope: :ingredient }

# associations
  belongs_to :dish
  belongs_to :ingredient
end
