class Portion < ApplicationRecord
# associations
  belongs_to :dish
  belongs_to :ingredient
end
